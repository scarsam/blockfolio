class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user, :authorize_coin_portfolio, :authorize_portfolio, :fetch_api

  def authenticate_user
    redirect_to root_path unless logged_in?
  end

  def authorize_coin_portfolio
    redirect_to welcome_path unless CoinPortfolio.where(id: params[:id]).joins(:portfolio => :user).where(:users => {:id => current_user.id}).any?
  end

  def authorize_portfolio
    redirect_to welcome_path unless Portfolio.where(id: params[:id]).where(:user_id => current_user).any?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def fetch_api
    portfolio_coins = Coin.with_portfolios
    ExternalCryptoApi.update(portfolio_coins)
  end

end
