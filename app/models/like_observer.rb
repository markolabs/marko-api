class LikeObserver < ActiveRecord::Observer
  def after_create(like)
    $mixpanel.track "Message Liked", {
      distinct_id: like.user_id,
      message_id: like.message_id
    }
  end

  def after_destroy(like)
    $mixpanel.track "Message Unliked", {
      distinct_id: like.user_id,
      message_id: like.message_id
    }
  end
end
