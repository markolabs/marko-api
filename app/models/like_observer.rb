class LikeObserver < ActiveRecord::Observer
  def after_create(like)
    Thread.new do
      $mixpanel.track like.user_id, "Message Liked", {
        message_id: like.message_id
      }
    end
  end

  def after_destroy(like)
    Thread.new do
      $mixpanel.track like.user_id, "Message Unliked", {
        message_id: like.message_id
      }
    end
  end
end
