class NotificationObserver < ActiveRecord::Observer
  def after_create(notification)
    notification.receiver.send_notification(notification.text, notification.payload)
    $mixpanel.track notification.sender_id, "Notifcation Sent", {
      type: notification.verb
    }
    $mixpanel.track notification.receiver_id, "Notifcation Received", {
      type: notification.verb
    }
  end
end
