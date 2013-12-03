class V2::FlagsController < V2::ApiController
  before_filter :require_login

  def create
    message = Message.find(params[:message_id])
    flag = message.flags << @current_user

    message.user.send_notification("#{@current_user.username} flagged your mark!", {message_id: message.id})

    expose flag
  end

end
