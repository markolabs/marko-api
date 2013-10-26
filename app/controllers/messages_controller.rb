class MessagesController < ApiController
  # before_filter :require_login, only: [:create]

  def index
    params[:page] ||= 1
    unless (params[:latitude].nil? && params[:longitude].nil?)
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f

      if (ENV['QUERY_TYPE'] == "omega")
        messages = Message.order("distance ASC").limit(20).near([params[:latitude], params[:longitude]], params[:radius]).page(params[:page])
      else
        messages = Message.order("created_at DESC").limit(20).near([params[:latitude], params[:longitude]], params[:radius]).page(params[:page])
      end

    else
      messages = Message.order("created_at DESC").limit(20).page(params[:page])
    end

    paginated messages
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    # params[:message][:user_id] = @current_user.id if params[:message][:user_id].nil?
    params[:message][:user_id] = 2 if params[:message][:user_id].nil?

    expose Message.create(params[:message])
    # expose params[:message]
  end
end
