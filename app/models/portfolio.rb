class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios
  accepts_nested_attributes_for :coins, reject_if: :all_blank

  # Instantiate coins from API
  def coins_attributes=(coin_attributes)
    coin_attributes.each do |key, attribute|
      self.coins << Coin.find_or_create_by(attribute)
    end
  end
end