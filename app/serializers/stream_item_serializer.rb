class StreamItemSerializer < ActiveModel::Serializer
  def serializable_hash
    location_serializer_hash.merge distance_serializer_hash
  end

  private

  def location_serializer_hash
    MessageSerializer.new(object, options).serializable_hash
  end

  def distance_serializer_hash
    DistanceSerializer.new(object, options).serializable_hash
  end
end
