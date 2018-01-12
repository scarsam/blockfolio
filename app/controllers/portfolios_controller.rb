class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
    10.times { @portfolio.coins.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, coins_attributes: [:name, :quantity])
  end

end
