class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to portfolios_path
    else
      flash[:error] = "Couldn't find email or password"
      redirect_to login_path
    end
  end

  def create_facebook
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = 'testing123'
    end
    session[:user_id] = user.id
    redirect_to portfolios_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
