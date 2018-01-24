class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  # Instantiate coins from API
  def coin_portfolios_attributes=(coin_attributes)
    coin_attributes.each do |key, attribute|
      unless attribute.empty?
        coins << Coin.find(attribute[:id])
        coin_portfolios.last.quantity = attribute[:quantity]
      end
    end
  end

end