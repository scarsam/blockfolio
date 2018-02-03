class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  def coins_attributes=(coin_portfolios_attributes)
    coin_portfolios_attributes.each do |index, attribute|
      coin_portfolio = CoinPortfolio.find_by(portfolio_id: self.id, coin_id: attribute[:coin_id])
      coin_portfolio.quantity = attribute[:quantity]
      coin_portfolio.save
    end
  end

end