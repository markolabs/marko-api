# == Schema Information
#
# Table name: messages
#
#  id                 :integer          not null, primary key
#  latitude           :float
#  longitude          :float
#  message_type       :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  caption            :string(255)
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  attr_accessible :caption, :image, :latitude, :longitude, :message_type

  after_post_process :post_process_photo

  def post_process_photo
    imgfile = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    return unless imgfile

    self.latitude = imgfile.gps_latitude
    self.longitude = imgfile.gps_longitude
    self.created_at = imgfile.date_time
  end

end
