# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :friend_id, uniqueness: { scope: :user_id }

  attr_accessible :user_id, :friend_id

  # before_create :create_reverse_relationship
  # before_destroy :destroy_reverse_relationship

  def create_reverse_relationship
    Relationship.skip_callback(:create)
    Relationship.create(user_id: self.friend_id, friend_id: self.user_id)
    Relationship.set_callback(:create)
  end

  def destroy_reverse_relationship
    Relationship.skip_callback(:destroy)
    Relationship.where(user_id: self.friend_id, friend_id: self.user_id).destroy_all
    Relationship.set_callback(:destroy)
  end

end
