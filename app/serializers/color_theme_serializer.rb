class ColorThemeSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attribute :name
  attribute :background
  attribute :text
end
