class LikesController < ApiController
  before_filter :require_login, only: [:create, :destroy]

  def show
    params[:page] ||= 1

    paginated Message.find(params[:message_id]).likes.page(params[:page])
  end

  def create
    expose Message.find(params[:message_id]).likes << @current_user
  end

  def destroy
    expose Message.find(params[:message_id]).likes.destroy @current_user
  end
end
