class Coin < ApplicationRecord
  has_many :coin_portfolios
  has_many :portfolios, through: :coin_portfolios
  attr_accessor :quantity

  # def quantity(portfolio_id)
  #   coin_portfolio = CoinPortfolio.find_by(coin_id: self.id, portfolio_id: portfolio_id)
  #   coin_portfolio.quantity
  # end
end
