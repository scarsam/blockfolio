class CoinPortfoliosController < ApplicationController
  before_action :set_coin_portfolio, only: [:edit, :update]
  before_action :set_portfolio, only: [:create]

  def create
    # Display errors here
    @portfolio.coin_portfolios.build(coin_portfolios_params)
    @portfolio.save
    redirect_to portfolio_path(@portfolio)
  end

  def update
    @coin_portfolio.assign_attributes(coin_portfolios_params)
    if @coin_portfolio.changed?
      @coin_portfolio.save
      portfolio = @coin_portfolio.portfolio
      coin = @coin_portfolio.coin
      redirect_to portfolio_coin_path(portfolio, coin)
    else
      render :edit
    end
  end

  private
  def set_coin_portfolio
    @coin_portfolio = CoinPortfolio.find(params[:id])
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def coin_portfolios_params
    params.require(:coin_portfolio).permit(:quantity, :coin_attributes => [:name])
  end
end
