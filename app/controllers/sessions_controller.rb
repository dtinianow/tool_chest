class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have been logged in!"
      redirect_to user_tools_path(user)
    else
      flash[:danger] = "Invalid Login!"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
