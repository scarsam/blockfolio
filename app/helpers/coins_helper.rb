module CoinsHelper

  def display_value(coin, portfolio)
    coin_portfolio = find_coin_portfolio(coin, portfolio)
    coin_portfolio.set_value(coin)
    coin_portfolio.value
  end

end