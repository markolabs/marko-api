class V2::UsersController < V2::ApiController
  before_filter :require_login, except: [:index, :create]

  def index
    users = User.where(params[:user]).first!
    expose users
  end

  def show
    user = User.find(params[:id])
    expose user
  end

  def create
    user = User.create!(params[:user])
    user.add_fb_friends
    expose user
  end

  def likes
    params[:page] ||= 1

    likes = @current_user.likes.select("messages.id").page(params[:page]).per_page(500)

    paginated likes, serializer: false
  end
end
