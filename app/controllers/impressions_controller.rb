class ImpressionsController < ApiController
  before_filter :require_login

  def create
    expose Impression.create(user_id: @current_user.id, message_id: params[:message_id])
  end
end
