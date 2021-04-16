class PagesController < ApplicationController

  before_action :logged_in_user, only: [:dashboard]
  
  def dashboard
    @activities = Activity.paginate(page: params[:page], per_page: 10)
  end

  def about
  end

  def contact
  end
end
