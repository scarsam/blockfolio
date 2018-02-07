class CoinsController < ApplicationController

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin = Coin.find(params[:coin][:id])
    @coin.coin_portfolios.build(coin_portfolios_params)
    @coin.save
    redirect_to portfolio_path(@portfolio)
  end

  private
  def coin_portfolios_params
    params.require(:coin).permit(:id, :coin_portfolios => [:portfolio_id, :quantity])
  end
end