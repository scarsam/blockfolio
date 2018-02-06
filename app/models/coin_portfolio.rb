class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  def coin_attributes=(attributes)
    attributes.each do |index, id|
      self.coin = Coin.find(id)
    end
  end

end
