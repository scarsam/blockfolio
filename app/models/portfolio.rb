class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios

  # Instantiate coins from API
  def coins_attributes=(coin_attributes)
    coin_attributes.each do |key, attribute|
      unless attribute.empty?
        coins << Coin.find_by(name: attribute[:name])
      end
    end
  end

end