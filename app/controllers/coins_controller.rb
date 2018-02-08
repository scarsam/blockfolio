class CoinsController < ApplicationController

  def create
    portfolio = Portfolio.find(params[:portfolio_id])
    coin = Coin.find(params[:coin][:id])
    portfolio.coins << coin

    coin_portfolio = CoinPortfolio.find_by(portfolio_id: portfolio.id, coin_id: coin.id)
    coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(portfolio)
  end

  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.find(params[:id])
    @coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
  end

  def update
    portfolio = Portfolio.find(params[:portfolio_id])
    coin = Coin.find(params[:id])

    coin_portfolio = CoinPortfolio.find_by(portfolio_id: portfolio.id, coin_id: coin.id)
    coin_portfolio.coin = Coin.find(params[:coin][:id])
    coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(portfolio)
  end

  private
  def coin_portfolios_params
    params.require(:coin).permit(:coin_portfolios => [:quantity])
  end
end