class CoinPortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
end
