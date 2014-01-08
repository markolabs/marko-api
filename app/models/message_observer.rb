class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    $mixpanel.track message.user_id, "Message Created", {
      latitude: message.latitude,
      longitude: message.longitude,
      message_id: message.id
    }
  end

  def after_destroy(message)
    $mixpanel.track message.user_id, "Message Deleted", {
      message_id: message.id
    }
  end
end
