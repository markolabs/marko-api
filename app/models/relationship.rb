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

  validates :friend_id, presence: true, numericality: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, numericality: true

  attr_accessible :user_id, :friend_id
end
