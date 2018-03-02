class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }
  validates_presence_of :name
end