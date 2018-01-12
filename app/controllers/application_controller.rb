class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
