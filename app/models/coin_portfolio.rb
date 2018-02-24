class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  validates :coin, presence: true
  validates :portfolio, presence: true
  validates :quantity, presence: true

  def coin_attributes=(attribute)
    if coin = Coin.find_by(name: attribute[:name])
      self.coin_id = coin.id
    end
  end

  def set_value(coin)
    self.update(value: self.quantity * coin.price_usd)
  end

end
