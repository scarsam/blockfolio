class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :coin_portfolios
  has_many :coins, through: :coin_portfolios, dependent: :destroy
  validates :name, presence: true
  validate :ensure_unique_name, on: :create

  def display_total_value
    value = 0
    self.coin_portfolios.each do |coin_portfolio|
      value += coin_portfolio.value unless coin_portfolio.value.nil?
    end
    self.update(total_value: value)
    value
  end

  def display_owner(current_user)
    if self.user == current_user
      self.user.email + ' (You)'
    else
      self.user.email
    end
  end

  private
  def ensure_unique_name
    if self.user.portfolios.where(name: self.name).any?
      errors[:unique_name] << 'You already have an portfolio with this name'
    end
  end
end