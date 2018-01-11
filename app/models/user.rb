class User < ApplicationRecord
  has_many :portfolios
  has_secure_password

  validates_presence_of :email
  validates_presence_of :password
end
