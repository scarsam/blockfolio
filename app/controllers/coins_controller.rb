class CoinsController < ApplicationController
  before_action :set_portfolio, only: [:create, :edit, :update]
  before_action :set_coin, only: [:edit, :update]

  def create
    @coin = Coin.find(params[:coin][:id])
    @portfolio.coins << @coin

    coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
    coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(@portfolio)
  end

  def edit
    @coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
  end

  def update
    coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
    coin_portfolio.coin = Coin.find(params[:coin][:id])
    coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(@portfolio)
  end

  private
  def set_coin
    @coin = Coin.find(params[:id])
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def coin_portfolios_params
    params.require(:coin).permit(:coin_portfolios => [:quantity])
  end
end