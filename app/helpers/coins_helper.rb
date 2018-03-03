module CoinsHelper

  def display_value(coin, portfolio)
    coin_portfolio = CoinPortfolio.find_by(coin_id: coin.id, portfolio_id: portfolio.id)
    coin_portfolio.set_value(coin)
  end

end