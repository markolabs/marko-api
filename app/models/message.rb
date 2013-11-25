# == Schema Information
#
# Table name: messages
#
#  id                 :integer          not null, primary key
#  latitude           :float
#  longitude          :float
#  type               :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  caption            :string(255)
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  likes_count        :integer
#  image_processing   :boolean
#  flags_count        :integer
#

class Message < ActiveRecord::Base
  attr_accessible :caption, :image, :latitude, :longitude, :user_id, :user

  self.per_page = 20

  has_many :like_joins, class_name: "Like"
  has_many :likes, through: :like_joins, source: :user

  has_many :flag_joins, class_name: "Flag"
  has_many :flags, through: :flag_joins, source: :user

  has_many :impressions

  belongs_to :user

  has_attached_file :image, :styles => { :square => "640x640#" }
  process_in_background :image

  reverse_geocoded_by :latitude, :longitude

  def self.from_friends(user)
    friend_ids = Relationship.where{user_id == my{user.id}}
    where{(user_id.in(friend_ids.select{:friend_id})) | (user_id == my{user.id})}
  end

  def self.hide_flags(user)
    flagged_messages = Flag.where{user_id == my{user.id}}
    where{id.not_in(flagged_messages.select{:message_id})}
  end

end
