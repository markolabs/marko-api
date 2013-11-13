class LikesController < ApiController
  before_filter :require_login, only: [:create, :destroy]

  def show
    params[:page] ||= 1

    paginated Message.find(params[:message_id]).likes.page(params[:page])
  end

  def create
    like = Message.find(params[:message_id]).likes << @current_user
    Keen.publish("message_liked", like)
    expose like
  end

  def destroy
    unlike = Message.find(params[:message_id]).likes.destroy @current_user
    Keen.publish("message_unliked", unlike)
    expose unlike
  end
  
end
