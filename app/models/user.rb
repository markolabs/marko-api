# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  fb_user_id       :integer
#  username         :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fb_token         :string(255)
#  fb_token_expired :boolean
#  deleted_at       :time
#

class User < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :fb_user_id, :username, :fb_token, :fb_token_expired

  validates :username, presence: true, uniqueness: true
  validates :fb_user_id, presence: true, uniqueness: true, numericality: true

  has_many :like_joins, class_name: "Like", dependent: :destroy
  has_many :likes, through: :like_joins, source: :message

  has_many :flag_joins, class_name: "Flag", dependent: :destroy
  has_many :flags, through: :flag_joins, source: :message

  has_many :messages, dependent: :destroy

  has_many :relationships, foreign_key: "friend_id", dependent: :destroy
  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
  has_many :friends, through: :relationships, source: :user

  has_many :pings
  has_many :impressions

  has_many :sessions
  has_many :devices

  has_many :sent_drop_joins, class_name: "Drop", foreign_key: "sender_id", dependent: :destroy
  has_many :received_drop_joins, class_name: "Drop", foreign_key: "receiver_id", dependent: :destroy
  has_many :sent_drops, through: :sent_drop_joins, source: :message
  has_many :received_drops, through: :received_drop_joins, source: :message

  def send_notification(text, info={})
    ZeroPush.notify({
      device_tokens: self.devices.collect(&:token),
      alert: text,
      sound: "default",
      info: info.to_json
    })
  end
  # handle_asynchronously :send_notification

  def fb_user
    return nil if self.fb_token.nil?
    user = FbGraph::User.me(self.fb_token)

    begin
      user = user.fetch
    rescue Exception => msg
      self.fb_token_expired = true
      logger.debug msg
      return nil
    end

    return user
  end

  def fb_friends
    return nil if self.fb_user.nil?
    
    friend_ids = Array.new
    self.fb_user.friends.each do |friend|
      friend_ids << friend.identifier
    end

    return friend_ids
  end

  def add_fb_friends
    return false if self.fb_friends.blank?
    friends = User.where(fb_user_id: self.fb_friends)

    Relationship.transaction do 
      friends.each do |f|
        Relationship.where(user_id: self.id, friend_id: f.id).first_or_create
        Relationship.where(user_id: f.id, friend_id: self.id).first_or_create
      end
    end
  end
  handle_asynchronously :add_fb_friends

  def extend_fb_token
    return false if self.fb_token.nil?

    fb_auth = FbGraph::Auth.new(ENV['FB_APP_ID'], ENV['FB_APP_SECRET'])
    fb_auth.exchange_token! self.fb_token
    self.fb_token = fb_auth.access_token.access_token
  end

end
