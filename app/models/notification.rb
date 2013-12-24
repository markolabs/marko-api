class Notification < ActiveRecord::Base
  attr_accessible :verb, :actor, :object, :target

  belongs_to :actor, polymorphic: true
  belongs_to :object, polymorphic: true
  belongs_to :target, polymorphic: true

  before_save :set_text

  def set_text
    self.text = case self.verb
      when "like" then "#{self.actor.username} liked your mark!"
    end
  end

end
