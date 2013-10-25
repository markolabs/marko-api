class MessageSerializer < ActiveModel::Serializer
  attribute :id
  attribute :message_type
  attribute :created_at
  attribute :image
  attribute :caption
  attribute :location
  attribute :distance

  has_one :user

  def image
    if object.image.exists?
      return object.image.url(:square)
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

  def distance
    if object.respond_to? :distance
      distance = object.distance.to_f
      distance = distance.round(3)
      return distance
    else
      return nil
    end
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

end
