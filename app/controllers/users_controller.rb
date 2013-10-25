class UsersController < ApiController
  def show
    
  end

  def create
    user = User.create(params[:user])
    expose user
  end
end
