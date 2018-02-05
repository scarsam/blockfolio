class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
    @portfolio.coins.build
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.valid?
      @portfolio.save
      redirect_to edit_portfolio_coin_portfolio_path(@portfolio, @portfolio.coin_portfolios.last)
    else
      render :new
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :coins_attributes => [:id])
  end

end
