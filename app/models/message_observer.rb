class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    Thread.new do
      $mixpanel.track message.user_id, "Message Created", {
        latitude: message.latitude,
        longitude: message.longitude,
        message_id: message.id
      }
    end
  end

  def after_destroy(message)
    Thread.new do
      $mixpanel.track message.user_id, "Message Deleted", {
        message_id: message.id
      }
    end
  end
end
