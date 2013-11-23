class ApiController < RocketPants::Base
  before_filter :set_user
  before_filter :current_user

  def set_user
    access_token = request.headers["fb_token"] || params["fb_token"]

    if access_token
      @current_user = User.find_by_fb_user_id(fb_id_from_token(access_token))
      if @current_user.fb_token_expired
        @current_user.update_attributes(fb_token: access_token, fb_token_expired: false)
        @current_user.delay.extend_fb_token
      end
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

  private

  def fb_id_from_token(token)
    if ((fb_id = Rails.cache.read({fb_token: token})).nil?)
      user = FbGraph::User.me token
      user = user.fetch
      fb_id = user.identifier
      Rails.cache.write({fb_token: token}, fb_id)
    end

    fb_id
  end

end