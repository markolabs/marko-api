class ImpressionObserver < ActiveRecord::Observer
  def after_create(impression)
    Thread.new do
      $mixpanel.track impression.user_id, "Message Viewed", {
        message_id: impression.message_id
      }
    end
  end
end
