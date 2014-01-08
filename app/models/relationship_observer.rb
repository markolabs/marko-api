class RelationshipObserver < ActiveRecord::Observer
  def after_create(relationship)
    Thread.new do
      $mixpanel.track relationship.user_id, "Relationship Created", {
        friend_id: relationship.friend_id
      }
    end
  end
end
