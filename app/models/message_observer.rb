class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    $mixpanel.track "Message Created", {
      distinct_id: message.user_id, 
      latitude: message.latitude,
      longitude: message.longitude,
      message_id: message.id
    }
  end

  def after_destroy(message)
    $mixpanel.track "Message Deleted", {
      distinct_id: message.user_id,
      message_id: message.id
    }
  end
end
