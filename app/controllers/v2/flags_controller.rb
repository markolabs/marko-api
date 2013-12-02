class V2::FlagsController < V2::ApiController
  before_filter :require_login

  def create
    flag = Message.find(params[:message_id]).flags << @current_user
    expose flag
  end

end
