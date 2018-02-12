class CoinsController < ApplicationController

  def show
    @coin = Coin.find(params[:id])
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
  end

end