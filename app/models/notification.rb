class Notification < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :actor, :object, :target

  belongs_to :actor, polymorphic: true
  belongs_to :object, polymorphic: true
  belongs_to :target, polymorphic: true

=======
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :target, polymorphic: true

  attr_accessible :read, :verb, :sender, :receiver, :target

  def text
    if self.verb == "like"
      "#{self.sender.username} liked your mark!"
    end
  end

  def payload
    if self.target_type == "Message"
      {message_id: self.target_id}
    end
  end

>>>>>>> dev
end
