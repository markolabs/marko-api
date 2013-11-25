class MessagesController < ApiController
  before_filter :require_login

  def index
    params[:page] ||= 1

    messages = Message.page(params[:page])

    unless (params[:latitude].nil? && params[:longitude].nil?)
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f

      @current_user.pings.create(params.slice(:latitude, :longitude))

      if (ENV['QUERY_TYPE'] == "omega")
        messages = messages.order("distance ASC")
      else
        messages = messages.order("created_at DESC")
      end

      messages = messages.near([params[:latitude], params[:longitude]], params[:radius])

    else
      messages = messages.order("created_at DESC")
    end

    if (params.has_key? "user_id")
      messages = messages.where(user_id: params[:user_id])
    end

    messages = messages.from_friends(@current_user) if @filter == "friends"
    # messages = messages.hide_flags(@current_user)

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
