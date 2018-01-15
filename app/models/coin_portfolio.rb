class CoinPortfolio < ApplicationRecord
  belongs_to :coin
  belongs_to :portfolio

end
