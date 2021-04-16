class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully logged in."
      if current_user.is_admin?
        redirect_to root_url
      else
        redirect_to root_url
      end
    else
      flash[:danger] = "Invalid credentials! Please try again."
      redirect_to login_url
    end
  end

  def destory
    log_out
    flash[:success] = "Successfuly logged out."
    redirect_to login_url
  end
end
