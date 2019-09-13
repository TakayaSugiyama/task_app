class User < ApplicationRecord
  has_secure_password
  has_many :tasks , dependent: :destroy

  validates :name, presence: true, length: {in: 3..10}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create
end
