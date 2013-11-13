class MessagesController < ApiController
  before_filter :require_login, only: [:create]

  def index
    params[:page] ||= 1

    messages = Message.page(params[:page])

    unless (params[:latitude].nil? && params[:longitude].nil?)
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f

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

    # messages = messages.from_friends(@current_user)

    paginated messages
  end

  def everyone
    index
  end

  def friends
    index
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    params[:message][:color_theme_id] = ColorTheme.random.id unless (params[:message].has_key? "image")
    params[:message][:user_id] = @current_user.id

    message = Message.create!(params[:message])
    Keen.publish("message_create", message)
    expose message
  end

  def destroy
    destroy = Message.find(params[:id]).destroy
    Keen.publish("message_destroy", destroy)
    expose destroy
  end
end
