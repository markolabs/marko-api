class Notification < ActiveRecord::Base
  attr_accessible :actor, :object, :target

  belongs_to :actor, polymorphic: true
  belongs_to :object, polymorphic: true
  belongs_to :target, polymorphic: true

end
