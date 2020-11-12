class ApplicationController < ActionController::Base
  include SessionsHelper
  include LessonsHelper
  #Authenticate User login
  def logged_in_user
    unless logged_in?
      flash[:warning] = "Warning! Please login."
      redirect_to root_url
    end
  end

  def admin_log_in
    unless logged_in? && admin_user?
      flash[:info] = "Opps! You are not authorized to access the link."
      if logged_in?
        redirect_to dashboard_url
      else
        redirect_to root_url
      end
    end
  end
end
