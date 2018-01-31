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
      redirect_to portfolio_quantity_new_path(@portfolio)
    else
      render :new
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    if @portfolio.valid?
      redirect_to portfolio_path(@portfolio)
    else
      render :edit
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end



  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :coin_ids => [], :coin_portfolios_attributes => [:coin_id, :quantity])
  end

end
