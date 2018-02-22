class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user, :authorize_coin_portfolio

  def authenticate_user
    redirect_to root_path unless logged_in?
  end

  def authorize_coin_portfolio
    redirect_to portfolios_path unless CoinPortfolio.where(id: params[:id]).joins(:portfolio => :user).where(:users => {:id => current_user.id}).any?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
