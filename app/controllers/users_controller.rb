class UsersController < RocketPants::Base
  def show
    
  end

  def create
    user = User.create(params[:user])
    expose user
  end
end
