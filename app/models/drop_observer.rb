class DropObserver < ActiveRecord::Observer  
  def after_create(drop)
    $mixpanel.track drop.sender_id, "Drop Sent", {
      receiver_id: drop.receiver_id, 
      message_id: drop.message_id
    }
  end
end
