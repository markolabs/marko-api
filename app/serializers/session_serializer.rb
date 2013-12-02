class SessionSerializer < ActiveModel::Serializer
  attribute :token
  has_one :user
  has_one :device
end
