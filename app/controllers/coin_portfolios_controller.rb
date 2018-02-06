class CoinPortfoliosController < ApplicationController

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @portfolio.coin_portfolios.build(coin_portfolio_params)
    if @portfolio.valid?
      @portfolio.save
      redirect_to portfolio_path(@portfolio)
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin_portfolio = CoinPortfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coin_portfolio = CoinPortfolio.find(params[:id])
    if @coin_portfolio.update(coin_portfolio_params)
      @coin_portfolio.save
      redirect_to portfolio_path(@portfolio)
    end
  end

  private
  def coin_portfolio_params
    params.require(:coin_portfolio).permit(:quantity, :coin_attributes => [:id])
  end
end
