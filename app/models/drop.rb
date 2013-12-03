# == Schema Information
#
# Table name: drops
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  message_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :time
#

class Drop < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :message

end
