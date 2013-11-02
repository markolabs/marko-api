class MessagesController < ApiController
  before_filter :require_login, only: [:create]

  def index
    params[:page] ||= 1

    messages = Message.page(params[:page])

    unless (params[:latitude].nil? && params[:longitude].nil?)
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f
      messages = messages.near([params[:latitude], params[:longitude]], params[:radius])

      if (ENV['QUERY_TYPE'] == "omega")
        messages = messages.order("distance ASC")
      else
        messages = messages.order("created_at DESC")
      end

    else
      messages = messages.order("created_at DESC")
    end

    if (params.has_key? "user_id")
      messages = messages.where(user_id: params[:user_id])
    end

    paginated messages
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    params[:message][:user_id] = @current_user.id

    expose Message.create!(params[:message])
    # expose params[:message]
  end

  def destroy
    expose Message.find(params[:id]).destroy!
  end
end
