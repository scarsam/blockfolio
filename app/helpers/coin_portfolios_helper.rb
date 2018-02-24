module CoinPortfoliosHelper

  def quantity(coin, portfolio)
    coin_portfolio = find_coin_portfolio(coin, portfolio)
    coin_portfolio.quantity
  end

end
