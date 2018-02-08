class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  def coin_portfolios=(attribute)
    self.quantity = attribute[:quantity]
  end
end
