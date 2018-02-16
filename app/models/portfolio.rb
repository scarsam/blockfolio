class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios, inverse_of: :portfolio
  has_many :coins, through: :coin_portfolios
  # Custom validator
  validates :name, presence: true
  validate :ensure_unique_name, on: :create

  def total_value
    total_value = 0
    self.coin_portfolios.each do |coin_portfolio|
      total_value += coin_portfolio.total_value
    end
    total_value
  end

  private
  def ensure_unique_name
    if self.user.portfolios.where(name: self.name).any?
      errors[:unique_name] << 'You already have an portfolio with this name'
    end
  end
end