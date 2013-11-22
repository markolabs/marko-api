# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fb_user_id :integer
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fb_token   :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :fb_user_id, :username, :fb_token

  validates :username, presence: true, uniqueness: true
  validates :fb_user_id, presence: true, uniqueness: true, numericality: true

  has_many :like_joins, class_name: "Like", dependent: :destroy
  has_many :likes, through: :like_joins, source: :message

  has_many :messages, dependent: :destroy

  has_many :relationships, foreign_key: "friend_id"
  has_many :friends, through: :relationships, source: :user

  def fb_user
    return nil if self.fb_token.nil?
    user = FbGraph::User.me(self.fb_token)

    begin
      user = user.fetch
    rescue Exception => msg
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
