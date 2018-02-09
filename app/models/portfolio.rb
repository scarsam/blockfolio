class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios
  # Custom validator
  validate :ensure_unique_name, on: :create

  private
  def ensure_unique_name
    if self.user.portfolios.where(name: self.name).any?
      errors[:unique_name] << 'You already have an portfolio with this name'
    end
  end
end