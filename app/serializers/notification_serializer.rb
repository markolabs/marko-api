class NotificationSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attribute :id
  attribute :verb
  has_one :sender

  attribute :target_type
  attribute :target_id
  has_one :target
end
