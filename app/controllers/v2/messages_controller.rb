class V2::MessagesController < V2::ApiController
  jsonp
  
  before_filter :require_login

  def index
    # set page to 1 by default
    params[:page] ||= 1

    # initiate the message query with a page request
    messages = Message.page(params[:page])

    unless (params[:latitude].nil? && params[:longitude].nil?)
      # set radius equal to env variable if not passed as paramater
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f

      if (ENV['QUERY_TYPE'] == "omega")
        # orders by distance if query type is omega (set as ENV variable)
        messages = messages.order("distance ASC")
      else
        # otherwise order by created_at timestamp
        messages = messages.order("created_at DESC")
      end

      # limit messages to those near the latitude and longitude (within radius)
      messages = messages.near([params[:latitude], params[:longitude]], params[:radius])

      # sets a users current location (marko ping) based on their request location
      # only does this one per pagination
      @current_user.pings.create!(params.slice(:latitude, :longitude)) # if (params[:page].to_i == 1)

    else
      # order messages by time if there is no latitude and longitude
      messages = messages.order("created_at DESC")
    end

    if (params.has_key? "user_id")
      # if user_id is a parameter, only show messages by that user
      messages = messages.where(user_id: params[:user_id])
    end

    # show only messages from friends if friends filter is set
    messages = messages.from_friends(@current_user) if @filter == "friends"
    
    # hide messages that the current_user has flagged
    messages = messages.hide_flags(@current_user)

    # cache the request until there is somethign new added to the messages collection
    fresh_when last_modified: messages.maximum(:updated_at), public: true

    paginated messages
  end

  def everyone
    @filter = "everyone"
    index
  end

  def friends
    @filter = "friends"
    index
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    params[:message][:user_id] = @current_user.id

    message = Message.create!(params[:message])
    expose message
  end

  def destroy
    destroy = Message.find(params[:id]).destroy
    expose destroy
  end
end
