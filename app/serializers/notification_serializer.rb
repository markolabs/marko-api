class NotificationSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attribute :id
  attribute :read
  attribute :verb
  attribute :text
  has_one :sender

  attribute :target_type
  attribute :target_id
  has_one :target

  def read
    return false if object.read.nil?
    return true
  end
end
