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
    if @portfolio.valid?
      @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, coins_attributes: [:name, :quantity])
  end

end
