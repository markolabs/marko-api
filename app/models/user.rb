# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  fb_user_id          :integer
#  username            :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  provider            :string(255)
#  uid                 :string(255)
#  name                :string(255)
#  fb_token            :string(255)
#  fb_token_expired    :boolean
#  deleted_at          :time
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  first_name          :string(255)
#  last_name           :string(255)
#

class User < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :fb_user_id, :username, :fb_token, :fb_token_expired

  has_attached_file :avatar, :preserve_files => true
  # process_in_background :avatar

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

  before_create :get_name_from_facebook

  def send_notification(text, info={})
    return false if self.devices.blank?

    Thread.new do
      ZeroPush.notify({
        device_tokens: self.devices.collect(&:token),
        alert: text,
        sound: "default",
        info: info.to_json
      })
    end
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

  def get_avatar_from_facebook
    self.avatar = open("http://graph.facebook.com/#{self.fb_user_id}/picture")
    self.avatar.instance_write(:file_name, "#{self.username}-avatar")
  end

  def get_name_from_facebook
    begin
      user = FbGraph::User.fetch(self.fb_user_id)
      self.first_name = user.first_name
      self.last_name = user.last_name
    rescue Exception => msg
      return nil
    end

    "#{self.first_name} #{self.last_name}"
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
