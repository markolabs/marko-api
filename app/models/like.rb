# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  message_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base
  belongs_to :message, counter_cache: true, touch: true
  belongs_to :user
  
  validates :user_id, presence: true, numericality: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true, numericality: true

end
