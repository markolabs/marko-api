class ApiController < RocketPants::Base
  before_filter :set_user

  def set_user
    access_token = request.headers["fb_user_id"] || params["fb_user_id"]

    if access_token
      @current_user = User.find_by_fb_user_id(access_token)
    else
      @current_user = nil
    end
  end

  def require_login
    error! :unauthenticated if @current_user.nil?
  end

end