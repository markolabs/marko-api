class RelationshipsController < ApiController
  before_filter :require_login

  def create
    # create relationships for currnt user
    friends = User.where(fb_user_id: @current_user.fb_friends)
    @current_user.friends = friends

    expose friends
  end
end
