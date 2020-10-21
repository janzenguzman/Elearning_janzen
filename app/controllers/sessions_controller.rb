class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully logged in."
      redirect_to dashboard_url
    else
      flash[:danger] = "Invalid credentials"
      redirect_to root_url
    end
  end

  def destory
    log_out
    flash[:success] = "Successfuly logged out."
    redirect_to root_url
  end
end
