class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have been logged in!"
      if current_admin?
        redirect_to admin_tools_path
      else
        redirect_to user_tools_path(user)
      end
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
