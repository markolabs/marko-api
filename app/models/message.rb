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
#  color_theme_id     :integer
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
    friend_ids = "SELECT friend_id FROM relationships
                         WHERE user_id = :user_id"
    where("user_id IN (#{friend_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  after_post_process :post_process_photo

  def post_process_photo
    return unless self.latitude.nil? && self.longitude.nil?
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    return unless imgfile

    logger.info imgfile.inspect

    latitude = imgfile.gps_latitude.to_f
    longitude = imgfile.gps_longitude.to_f

    latitude = latitude * -1 if imgfile.gps_latitude_ref == "S"
    longitude = longitude * -1 if imgfile.gps_longitude_ref == "W"

    self.latitude = latitude
    self.longitude = longitude
    self.created_at = imgfile.date_time
  end

end
