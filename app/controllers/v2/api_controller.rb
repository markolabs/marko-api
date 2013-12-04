class V2::ApiController < RocketPants::Base  
  before_filter :set_user
  before_filter :current_user_me

  def current_session
    access_token = request.headers["access_token"] || params["access_token"]

    if access_token
      Session.find_by_token(access_token)
    else
      nil
    end
  end

  def current_user
    if current_session
      current_session.user
    else
      nil
    end
  end

  def current_device
    if current_session
      current_session.device
    else
      nil
    end
  end

  def set_user
    @current_user = current_user
  end

  def require_login
    error! :unauthenticated if @current_user.nil?
  end

  protected

  def fb_id_from_token(token)
    if ((fb_id = Rails.cache.read({fb_token: token})).nil?)
      user = FbGraph::User.me token
      user = user.fetch
      fb_id = user.identifier
      Rails.cache.write({fb_token: token}, fb_id)
    end

    fb_id
  end

  private

  def current_user_me
    if params[:id] == "me"
      require_login
      params[:id] = @current_user.id 
    end

    if params[:user_id] == "me"
      require_login
      params[:user_id] = @current_user.id
    end
  end

end