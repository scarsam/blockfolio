class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  def coin_portfolios_attributes=(attributes)
    attributes.each do |id, attribute|
      self.quantity = attribute[:quantity]
    end
  end

  def coin_name
    Coin.find(coin_id).name
  end
end
