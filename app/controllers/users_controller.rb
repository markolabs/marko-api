class UsersController < ApiController

  def show
    user = User.find(params[:id])
    expose user
  end

  def create
    user = User.create!(params[:user])
    expose user
  end
end
