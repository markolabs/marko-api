class QueueItem < ActiveRecord::Base
  belongs_to :message
  belongs_to :sender
  belongs_to :recipient
  
  # attr_accessible :title, :body
end
