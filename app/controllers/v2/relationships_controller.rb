class V2::RelationshipsController < V2::ApiController
  before_filter :require_login

  def create
    # create relationships for currnt user
    expose @current_user.add_fb_friends
  end
end
