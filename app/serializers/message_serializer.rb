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
    object.image.url(:square)
  end

  def location
    {
      latitude: object.latitude,
      longitude: object.longitude    
    }
  end

  def distance
    if object.methods.include? "distance"
      distance = object.distance.to_f
      distance = distance.round(3)
      return distance
    else
      return nil
    end
  end

end
