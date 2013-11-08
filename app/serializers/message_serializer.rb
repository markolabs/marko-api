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
  # attribute :distance

  has_one :color_theme
  has_one :user
  attribute :user_liked_post

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

  def like_count
    object.likes.count
  end

  def user_liked_post
    scope
  end

end
