class MessageSerializer < ActiveModel::Serializer
  attribute :id
  attribute :message_type
  attribute :created_at
  attribute :image
  attribute :caption
  attribute :location

  has_one :user

  def location
    {
      latitude: object.latitude,
      longitude: object.longitude    
    }
  end

end
