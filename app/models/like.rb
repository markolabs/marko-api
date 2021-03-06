# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  message_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :time
#

class Like < ActiveRecord::Base
  # acts_as_paranoid

  belongs_to :message, counter_cache: true, touch: true
  belongs_to :user
  
  validates :user_id, presence: true, numericality: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true, numericality: true

  after_create :notify

  def notify
    Notification.create({
      verb: "like",
      target: self.message,
      sender: self.user,
      receiver: self.message.user
    })
  end
end
