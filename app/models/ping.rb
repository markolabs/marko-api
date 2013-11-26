# == Schema Information
#
# Table name: pings
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :time
#

class Ping < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  attr_accessible :latitude, :longitude, :user, :user_id

  reverse_geocoded_by :latitude, :longitude
end
