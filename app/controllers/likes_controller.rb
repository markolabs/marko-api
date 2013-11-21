class LikesController < ApiController
  before_filter :require_login

  def show
    params[:page] ||= 1

    paginated Message.find(params[:message_id]).likes.page(params[:page])
  end

  def create
    like = Message.find(params[:message_id]).likes << @current_user
    expose like
  end

  def destroy
    unlike = Message.find(params[:message_id]).likes.destroy @current_user
    expose unlike
  end
  
end
