class Like < ActiveRecord::Base
  belongs_to :message, counter_cache: true, touch: true
  belongs_to :user
  
  validates :user_id, presence: true, numericality: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true, numericality: true

end
