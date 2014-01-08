class NotificationObserver < ActiveRecord::Observer
  def after_create(notification)
    notification.receiver.send_notification(notification.text, notification.payload)
    $mixpanel.track "Notifcation Sent", {
      distinct_id: notification.sender_id, 
      type: notification.verb
    }
    $mixpanel.track "Notifcation Received", {
      distinct_id: notification.receiver_id, 
      type: notification.verb
    }
  end
end
