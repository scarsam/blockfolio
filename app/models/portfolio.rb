class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios, dependent: :destroy
  # Custom validator
  validates :name, presence: true
  validate :ensure_unique_name, on: :create

  def total_value
    total_value = 0
    self.coin_portfolios.each do |coin_portfolio|
      total_value += coin_portfolio.total_value unless coin_portfolio.total_value.nil?
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