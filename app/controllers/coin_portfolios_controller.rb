class CoinPortfoliosController < ApplicationController
  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin_portfolio = CoinPortfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin_portfolio = CoinPortfolio.find(params[:id])
    if @coin_portfolio.update(coin_portfolio_params)
      redirect_to portfolio_path(@portfolio)
    end
  end

  private
  def coin_portfolio_params
    params.require(:coin_portfolio).permit(:quantity)
  end
end
