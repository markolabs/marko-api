class DistanceSerializer < ActiveModel::Serializer
  attribute :distance

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
