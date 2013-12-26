class V2::NotificationsController < V2::ApiController
  before_filter :require_login

  def index
    notifications = Notification.where(receiver_id: current_user.id)

    paginated notifications
  end
end
