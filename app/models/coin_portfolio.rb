class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

  def coin_name
    Coin.find(coin_id).name
  end
end
