class Coin < ApplicationRecord
  has_many :coin_portfolios
  has_many :portfolios, through: :coin_portfolios

  def self.with_portfolios
    Coin.joins(:portfolios)
  end

  def quantity(portfolio_id)
    coin_portfolio = CoinPortfolio.find_by(coin_id: self.id, portfolio_id: portfolio_id)
    coin_portfolio.quantity
  end

  def self.new_list(portfolio)
    Coin.all.reject { |coin| portfolio.coins.include?(coin) }
  end

  def self.edit_list(portfolio, edit_coin)
    Coin.all.reject { |coin| portfolio.coins.include?(coin) unless coin == edit_coin }
  end

  private


end
