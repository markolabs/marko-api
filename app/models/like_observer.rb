class LikeObserver < ActiveRecord::Observer
  def after_create(like)
    $mixpanel.track like.user_id, "Message Liked", {
      message_id: like.message_id
    }
  end

  def after_destroy(like)
    $mixpanel.track like.user_id, "Message Unliked", {
      message_id: like.message_id
    }
  end
end
