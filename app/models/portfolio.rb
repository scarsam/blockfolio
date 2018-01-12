class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  def coins_attributes=(coin_attribute)
    binding.pry
  end
end