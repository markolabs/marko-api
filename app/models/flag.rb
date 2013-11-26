# == Schema Information
#
# Table name: flags
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :time
#

class Flag < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :message, counter_cache: true, touch: true
  
  validates :user_id, presence: true, numericality: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true, numericality: true
end
