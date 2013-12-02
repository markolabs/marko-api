class V2::SessionsController < V2::ApiController
  def create
    user = User.find_by_fb_user_id(fb_id_from_token(params[:session][:fb_token]))

    device = user.devices.where(token: params[:session][:device_token]).first_or_create!

    session = Session.where(user: user, device: device).first_or_create!

    expose session
  end
end
