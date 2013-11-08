# == Schema Information
#
# Table name: color_themes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  background :string(255)
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ColorTheme < ActiveRecord::Base
  attr_accessible :background, :name, :text
end
