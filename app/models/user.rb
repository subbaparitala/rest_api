class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :posts 
  validates :username, presence: true 
end
