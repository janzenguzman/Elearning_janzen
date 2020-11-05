class ApplicationController < ActionController::Base
  include SessionsHelper
  include LessonsHelper
  #Authenticate User login
  def logged_in_user
    unless logged_in?
      flash[:info] = "Please login."
      redirect_to root_url
    end
  end

  def admin_log_in
    unless admin_user?
      flash[:info] = "You are not authorized to access the link."
      redirect_to root_url
    end
  end
end
