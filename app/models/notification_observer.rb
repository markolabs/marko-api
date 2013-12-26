class NotificationObserver < ActiveRecord::Observer
  def after_create(notification)
    notification.receiver.send_notification(notification.text, notification.payload)
  end
end
