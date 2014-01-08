class RelationshipObserver < ActiveRecord::Observer
  def after_create(relationship)
    $mixpanel.track "Relationship Created", {
      distinct_id: relationship.user_id,
      friend_id: relationship.friend_id
    }
  end
end
