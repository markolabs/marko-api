class V2::LikesController < V2::ApiController
  before_filter :require_login

  def show
    params[:page] ||= 1

    paginated Message.find(params[:message_id]).likes.page(params[:page])
  end

  def create
    message = Message.find(params[:message_id])
    like = message.likes << @current_user

    message.user.send_notification("#{@current_user.username} liked your mark!", {message_id: message.id})

    expose like
  end

  def destroy
    unlike = Message.find(params[:message_id]).likes.destroy @current_user
    expose unlike
  end
  
end
