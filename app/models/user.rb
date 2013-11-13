# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  fb_user_id             :integer
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  fb_token               :string(255)
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

  has_many :relationships, foreign_key: "friend_id"
  has_many :friends, through: :relationships, source: :user

end
