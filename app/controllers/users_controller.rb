class UsersController < ApiController
  before_filter :current_user
  
  def show
    user = User.find(params[:id])
    expose user
  end

  def create
    user = User.create!(params[:user])
    expose user
  end

  private

  def current_user
    if params[:id] == "me" 
      require_login
      params[:id] = @current_user.id 
    end
  end
end
