# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fb_user_id :integer
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :fb_user_id, :username

  validates :username, presence: true, uniqueness: true
  validates :fb_user_id, presence: true, uniqueness: true, numericality: true
end
