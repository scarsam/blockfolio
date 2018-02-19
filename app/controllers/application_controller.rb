class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def authenticate_user
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
