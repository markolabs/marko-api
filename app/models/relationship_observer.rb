class RelationshipObserver < ActiveRecord::Observer
  def after_create(relationship)
    $mixpanel.track relationship.user_id, "Relationship Created", {
      friend_id: relationship.friend_id
    }
  end
end
