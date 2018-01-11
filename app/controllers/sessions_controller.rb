class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def destroy
    # params / session. Look up
    session.destroy
    redirect_to root_path
  end
end
