# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Device < ActiveRecord::Base
  belongs_to :user
  attr_accessible :token, :user, :user_id

  validates :token, presence: true
  validates :user, presence: true

  def send_notification(text)
    
  end
end
