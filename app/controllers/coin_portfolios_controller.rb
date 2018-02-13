class CoinPortfoliosController < ApplicationController
  before_action :set_coin_portfolio, only: [:edit, :update]
  before_action :set_portfolio, only: [:create]

  def create
    @coin_portfolio = @portfolio.coin_portfolios.build(coin_portfolios_params)
    if @portfolio.valid?
      @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      @coin_portfolio.build_coin
      render :'portfolios/show'
    end

  end

  def update
    if @coin_portfolio.update(coin_portfolios_params)
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
