class Music < ActiveRecord::Base
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  has_many :followers
  has_many :songs
end
