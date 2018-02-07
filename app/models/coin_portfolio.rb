class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  def coin_portfolios=(attribute)
    self.portfolio_id = Portfolio.find(attribute[:portfolio_id]).id
    self.quantity = attribute[:quantity]
  end
end
