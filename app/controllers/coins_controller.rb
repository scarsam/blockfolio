class CoinsController < ApplicationController

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.new
    @coin.coin_portfolios.build
  end

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.find(params[:coin][:id])
    @portfolio.add_coin(@coin)
    @portfolio.coin_portfolios.update(coin_params)
    redirect_to portfolio_path(@portfolio)
  end

  private
  def coin_params
    params.require(:coin).permit(:id, :coin_portfolios_attributes => [:quantity])
  end

end