class User < ApplicationRecord
  has_many :portfolios
  has_secure_password
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password
end
