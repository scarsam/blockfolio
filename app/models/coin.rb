class Coin < ApplicationRecord
  has_many :coin_portfolios
  has_many :portfolios, through: :coin_portfolios, dependent: :destroy

  validates :name, presence: true
  validates :price_usd, presence: true
  validates :market_cap_usd, presence: true
  validates :percent_change_24h, presence: true
  validates :symbol, presence: true

  def self.with_portfolios
    Coin.joins(:portfolios)
  end

  def self.list(portfolio, edit_coin = nil)
    Coin.all.reject { |coin| portfolio.coins.include?(coin) unless coin == edit_coin }
  end

end
