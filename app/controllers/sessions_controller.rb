class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash.now[:success] = "Logged in"
      log_in @user
      redirect_to posts_url
    else
      flash.now[:danger] = "Credentials not recognised, please try again"
      render 'new'
    end
  end

  def delete
    sign_out
    flash[:success] = "Logged out"
    redirect_to posts_url
  end
end
