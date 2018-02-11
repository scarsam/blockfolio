class CoinsController < ApplicationController
  before_action :set_portfolio, only: [:create, :edit, :update]
  before_action :set_coin, only: [:edit, :update]
  before_action :set_coin_portfolio, only: [:edit, :update]

  def create
    @coin = Coin.find(params[:coin][:id])
    @portfolio.coins << @coin

    coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
    coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(@portfolio)
  end

  def update
    @coin_portfolio.coin = Coin.find(params[:coin][:id])
    @coin_portfolio.update(coin_portfolios_params)
    redirect_to portfolio_path(@portfolio)
  end

  private
  def set_coin_portfolio
    @coin_portfolio = CoinPortfolio.find_by(portfolio_id: @portfolio.id, coin_id: @coin.id)
  end

  def set_coin
    @coin = Coin.find(params[:id])
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  # Using custom attribute writer on coin_portfolios model and not on coin model
  # accepts_nested_attributes_for not getting used using custom
  # reject_if: proc { |attributes| attributes['name'].blank? }
  # Reason why is because I don't know how to update join table attribute and how to find an existing coin instead of creating a new one
  def coin_portfolios_params
    params.require(:coin).permit(:coin_portfolios => [:quantity])
  end
end