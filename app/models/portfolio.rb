class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  def coins_attributes=(coin_attributes)
    coin_attributes.each do |index, attribute|
      coins << Coin.find(attribute[:id])
    end
  end

  def add_coin(coin)
    coins << coin unless coins.include?(coin)
  end

end