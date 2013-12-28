class V2::NotificationsController < V2::ApiController
  before_filter :require_login

  def index
    params[:page] ||= 1

    notifications = Notification.page(params[:page])
                                .where(receiver_id: current_user.id)

    paginated notifications
  end
end
