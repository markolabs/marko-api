class FlagObserver < ActiveRecord::Observer  
  def after_create(flag)
    $mixpanel.track "Message Flagged", {
      distinct_id: flag.user_id,
      message_id: flag.message_id
    }
  end
end
