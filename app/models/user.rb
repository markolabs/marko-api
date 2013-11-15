# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fb_user_id :integer
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  fb_token   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :omniauthable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :fb_user_id, :username, :fb_token

  validates :username, presence: true, uniqueness: true
  validates :fb_user_id, presence: true, uniqueness: true, numericality: true
  validates :fb_token, presence: true

  has_many :like_joins, class_name: "Like", dependent: :destroy
  has_many :likes, through: :like_joins, source: :message

  has_many :messages, dependent: :destroy

  has_many :relationships, foreign_key: "friend_id"
  has_many :friends, through: :relationships, source: :user

  after_create :create_access_token

  def fb_friends
    return nil if self.fb_token.nil?
    user = FbGraph::User.me(self.fb_token)
    
    begin
      user = user.fetch
    rescue Exception => msg
      logger.debug msg
      return nil
    end

    friend_ids = Array.new
    user.friends.each do |friend|
      friend_ids << friend.identifier
    end

    return friend_ids
  end

  def add_fb_friends
    return false if self.fb_friends.blank?
    friends = User.where(fb_user_id: self.fb_friends)

    Relationship.transaction do 
      self.friends << friends
      friends.each { |f| f.friends << self }
    end
  end
  handle_asynchronously :add_fb_friends

end
