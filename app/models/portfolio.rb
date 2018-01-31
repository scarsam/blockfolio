class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  # Instantiate coins from API
  def coin_ids=(coin_attributes)
    coin_attributes.each do |coin_id|
      coins << Coin.find(coin_id) if coin_id.present?
    end
  end

  def coin_portfolios_attributes=(coin_portfolios_attributes)
    coin_portfolios_attributes.each do |index, attribute|
      CoinPortfolio.update(portfolio_id: self.id, coin_id: attribute[:id], quantity: attribute[:quantity])
    end
  end

end