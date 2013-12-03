# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :time
#

class Device < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :user
  attr_accessible :token, :user, :user_id

  validates :token, presence: true
  validates :user, presence: true

  def send_notification(text, info={})
    return false if self.token.blank?

    ZeroPush.notify({
      device_tokens: [self.token],
      alert: text,
      sound: "default",
      info: info.to_json
    })
  end
  # handle_asynchronously :send_notification

end
