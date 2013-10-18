class MessagesController < RocketPants::Base
  def index
    unless (params[:latitude].nil? && params[:longitude].nil?)
      params[:radius] ||= ENV['DEFAULT_RADIUS'].to_f
      messages = Message.order("created_at DESC").limit(20).near([params[:latitude], params[:longitude]], params[:radius])
    else
      messages = Message.order("created_at DESC").limit(20)
    end

    paginated messages
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    params[:message][:user_id] = 2 if params[:message][:user_id].nil?
    params[:message][:message_type] = "image" if params[:message][:message_type].nil?

    expose Message.create(params[:message])
    # expose params[:message]
  end
end
