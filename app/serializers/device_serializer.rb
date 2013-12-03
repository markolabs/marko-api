class DeviceSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  
  attribute :id
  attribute :token
end
