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

  # move validation to uniqueness key in db index
  # validates :friend_id, uniqueness: { scope: :user_id }

  attr_accessible :user_id, :friend_id
  
end
