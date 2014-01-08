class DropObserver < ActiveRecord::Observer
  include Mixpanel::Helper
  
  def after_create(drop)
    mixpanel.track "Drop Sent", {
      distinct_id: drop.sender_id, 
      receiver_id: drop.receiver_id, 
      message_id: drop.message_id
    }
  end
end
