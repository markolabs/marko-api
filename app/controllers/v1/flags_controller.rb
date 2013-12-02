class V1::FlagsController < V1::ApiController
  before_filter :require_login

  def create
    flag = Message.find(params[:message_id]).flags << @current_user
    expose flag
  end

end
