class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to portfolios_path
    else
      flash[:error] = "Couldn't find email or password"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
