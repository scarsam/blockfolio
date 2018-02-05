class CoinsController < ApplicationController

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = @portfolio.coins.build
  end

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.find(params[:coin][:id])
    @portfolio.add_coin(@coin)
    @coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
    redirect_to edit_portfolio_coin_portfolio_path(@portfolio, @coin_portfolio)
  end

end