# == Schema Information
#
# Table name: impressions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Impression < ActiveRecord::Base
  attr_accessible :user_id, :message_id

  belongs_to :user
  belongs_to :message
end
