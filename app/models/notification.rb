class Notification < ActiveRecord::Base
  cache
  

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :target, polymorphic: true

  attr_accessible :read, :verb, :sender, :receiver, :target
end
