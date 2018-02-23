class CoinPortfoliosController < ApplicationController
  before_action :set_coin_portfolio, only: [:edit, :update, :destroy]
  before_action :set_portfolio, only: [:create]
  before_action :authenticate_user
  before_action :authorize_coin_portfolio, only: [:edit]

  def create
    @coin_portfolio = @portfolio.coin_portfolios.build(coin_portfolios_params)
    if @portfolio.valid?
      @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      @coin_portfolio.build_coin
      @portfolio_coins = @portfolio.coins
      render :'portfolios/show'
    end
  end

  def update
    if @coin_portfolio.update(coin_portfolios_params)
      portfolio = @coin_portfolio.portfolio
      redirect_to portfolio_path(portfolio)
    else
      render :edit
    end
  end

  def destroy
    @portfolio = @coin_portfolio.portfolio
    @coin_portfolio.destroy
    redirect_to portfolio_path(@portfolio)
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
