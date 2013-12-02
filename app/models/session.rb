# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  token      :string(255)
#  user_id    :integer
#  device_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ActiveRecord::Base
  belongs_to :user
  belongs_to :device
  attr_accessible :token

  before_create :create_token

  private

  def create_token
   self.token = UUIDTools::UUID.timestamp_create.to_s   
  end

end
