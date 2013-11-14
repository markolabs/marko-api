class ApiController < RocketPants::Base
  before_filter :set_user
  before_filter :current_user

  def set_user
    access_token = request.headers["fb_user_id"] || params["fb_user_id"]

    if access_token
      @current_user = User.find_by_fb_user_id(access_token)
    else
      @current_user = nil
    end
  end

  def current_user
    if params[:id] == "me" 
      require_login
      params[:id] = @current_user.id 
    end

    if params[:user_id] == "me"
      require_login
      params[:user_id] = @current_user.id
    end
  end

  def require_login
    error! :unauthenticated if @current_user.nil?
  end

end