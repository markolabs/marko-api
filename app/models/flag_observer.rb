class FlagObserver < ActiveRecord::Observer  
  def after_create(flag)
    Thread.new do
      $mixpanel.track flag.user_id, "Message Flagged", {
        message_id: flag.message_id
      }
    end
  end
end
