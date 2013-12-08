class UserSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attribute :id
  attribute :fb_user_id
  attribute :avatar
  attribute :username
  attribute :name
  attribute :first_name
  attribute :last_name

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def avatar
    object.avatar.url
  end
end
