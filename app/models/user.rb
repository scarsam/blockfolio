class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :portfolios
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :password, presence: true
  validates_format_of :email, with: VALID_EMAIL, on: :create, message: 'Please enter a correct email address'
end
