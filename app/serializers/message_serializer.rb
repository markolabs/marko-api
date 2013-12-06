class MessageSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attribute :id
  attribute :message_type
  attribute :created_at
  attribute :like_count
  attribute :image
  attribute :caption
  attribute :location
  has_one :user

  def image
    if object.image.exists?
      if object.image_processing?
        ## this is hacky -- must fix
        return "http://s3.amazonaws.com/SpekApp" + object.image.path
      else
        return object.image.url(:square)
      end
    else
      return nil
    end
  end

  def location
    {
      latitude: object.latitude,
      longitude: object.longitude    
    }
  end

  def message_type
    if (caption && image)
      # "image-text"
      "image-text" # because image-text hasn't been implement in client
    elsif (caption)
      "text"
    else
      "image"
    end
  end

  def like_count
    object.likes.count
  end

end
