class MessagesController < RocketPants::Base
  def index
    paginated Message.all
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
