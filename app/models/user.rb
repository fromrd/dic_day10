class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, length:{maximum:255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  validates :password, presence: true,  length: { maximum: 30, minimum: 6 }
end
