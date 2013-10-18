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
    if m.image.exists?
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

end
