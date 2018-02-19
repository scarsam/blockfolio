class PortfoliosController < ApplicationController
  before_action :authenticate_user

  def user_portfolios
    @user = User.find(params[:user_id])
    @portfolios = @user.portfolios
  end

  def index
    @portfolios = Portfolio.all
    all_coins = Coin.with_portfolios
    ExternalCryptoApi.update(all_coins)
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
    @portfolio = Portfolio.find(params[:id])
    @coin_portfolio = CoinPortfolio.new
    @coin_portfolio.build_coin
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    portfolio.destroy
    redirect_to portfolios_path
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name)
  end

end
