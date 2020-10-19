class ApplicationController < ActionController::Base
  include SessionsHelper
  #Authenticate User login
  def logged_in_user
    unless logged_in?
      redirect_to root_url
    end
  end
end
