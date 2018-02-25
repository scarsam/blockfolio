class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :portfolios
  has_secure_password

  validates_presence_of :email, uniqueness: true
  validates_presence_of :password
  validates_format_of :email, with: VALID_EMAIL, on: :create, message: 'Please enter a correct email address'
end
