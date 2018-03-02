class UsersController < ApplicationController
  before_action :fetch_api, only: [:top_portfolios]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def top_portfolios
    @top_portfolios = Portfolio.order('total_value DESC')
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
