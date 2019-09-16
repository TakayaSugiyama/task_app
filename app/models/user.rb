class User < ApplicationRecord
  has_secure_password
  has_many :tasks , dependent: :destroy

  validates :name, presence: true, length: {in: 3..10}
  validates :email, presence: true,uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 6}, on: :create

  before_validation :not_all_false_admin 
 
  private
    def not_all_false_admin
      self.admin = true  if  self.class.all.map(&:admin).count(true) ==  1
    end 
end
