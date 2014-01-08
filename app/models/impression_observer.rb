class ImpressionObserver < ActiveRecord::Observer
  def after_create(impression)
    $mixpanel.track "Message Viewed", {
      distinct_id: impression.user_id,
      message_id: impression.message_id
    }
  end
end
