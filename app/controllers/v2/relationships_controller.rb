class V2::RelationshipsController < V2::ApiController
  before_filter :require_login

  def index
    params[:page] ||= 1

    relationships = User.find(params[:user_id]).friends.page(params[:page]).per_page(100)

    paginated relationships
  end
end
