class FlagObserver < ActiveRecord::Observer  
  def after_create(flag)
    $mixpanel.track flag.user_id, "Message Flagged", {
      message_id: flag.message_id
    }
  end
end
