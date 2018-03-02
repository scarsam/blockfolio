class Coin < ApplicationRecord
  has_many :coin_portfolios
  has_many :portfolios, through: :coin_portfolios
  validates_presence_of :name, :price_usd, :market_cap_usd, :percent_change_24h, :symbol

  def self.with_portfolios
    Coin.joins(:portfolios)
  end

  def self.list(portfolio, edit_coin = nil)
    Coin.all.reject { |coin| portfolio.coins.include?(coin) unless coin == edit_coin }
  end

end
