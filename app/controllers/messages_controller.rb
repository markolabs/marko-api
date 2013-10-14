class MessagesController < RocketPants::Base
  def index
    paginated Message.all
  end

  def show
    expose Message.find(params[:id])
  end

  def create
    expose Message.create(params[:message])
    # expose params[:message]
  end
end
