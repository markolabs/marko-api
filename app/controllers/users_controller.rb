class UsersController < ApiController

  def show
    user = User.find(params[:id])
    expose user
  end

  def create
    user = User.create!(params[:user])
    Keen.publish("user_creations", user)
    user.add_fb_friends
    expose user
  end
end
