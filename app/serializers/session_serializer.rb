class SessionSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  
  attribute :token
  has_one :user
  has_one :device
end
