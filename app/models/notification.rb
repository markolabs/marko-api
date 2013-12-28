# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  target_id   :integer
#  target_type :string(255)
#  read        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  verb        :string(255)
#  deleted_at  :time
#

class Notification < ActiveRecord::Base
  acts_as_paranoid
  
  attr_accessible :read, :verb, :sender, :receiver, :target

  self.per_page = 20

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :target, polymorphic: true

  validates :target_id, uniqueness: {scope: [:target_type, :verb, :sender_id, :receiver_id]}

  def text
    if self.verb == "like"
      "#{self.sender.username} liked your mark!"
    end
  end

  def payload
    if self.target_type == "Message"
      {message_id: self.target_id}
    end
  end

end
