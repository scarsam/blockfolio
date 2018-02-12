class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio
  validates_presence_of :quantity

  def coin_attributes=(attribute)
    if coin = Coin.find_by(name: attribute[:name])
      self.coin_id = coin.id
    end
  end

end
