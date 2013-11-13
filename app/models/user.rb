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
  include Redis::Objects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :omniauthable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :fb_user_id, :username

  validates :username, presence: true, uniqueness: true
  validates :fb_user_id, presence: true, uniqueness: true, numericality: true

  has_many :like_joins, class_name: "Like"
  has_many :likes, through: :like_joins, source: :message

  has_many :messages

  has_many :relationships, foreign_key: "friend_id" #, after_add: :create_reverse_relationship
  has_many :friends, through: :relationships, source: :user

  def fb_friends
    user = FbGraph::User.me(self.fb_token)
    user = user.fetch
    friend_ids = Array.new
    user.friends.each do |friend|
      friend_ids << friend.identifier
    end
    return friend_ids
  end

  private

  def create_reverse_relationship(relationship)
    Relationship.create(user_id: relationship.friend_id, friend_id: relationship.user_id)
  end

  def destroy_reverse_relationship(relationship)
    Relationship.where(user_id: relationship.friend_id, friend_id: relationship.user_id).destroy_all
  end

end
