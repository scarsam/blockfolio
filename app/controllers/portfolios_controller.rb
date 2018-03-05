class PortfoliosController < ApplicationController
  before_action :authenticate_user
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :fetch_api, only: [:index, :show, :user_portfolios]

  def welcome
    @portfolios = Portfolio.all
  end

  def index
    @user = User.find(params[:user_id])
    @portfolios = @user.portfolios
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.valid?
      @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
    @portfolio_coins = @portfolio.coins
    @coin_portfolio = CoinPortfolio.new
    @coin_portfolio.build_coin
  end

  def update
    @portfolio.update(portfolio_params)
    redirect_to portfolio_path(@portfolio)
  end

  def destroy
    @portfolio.destroy
    redirect_to welcome_path
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:name)
  end

end
