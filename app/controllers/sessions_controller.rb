class SessionsController < ApiController
  def create
    user = User.find_by_fb_user_id(params[:session][:fb_user_id])
    expose user
  end
end
