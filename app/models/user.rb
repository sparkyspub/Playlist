class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many :music
  has_many :followers
end
