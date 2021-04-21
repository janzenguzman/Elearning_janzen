class PagesController < ApplicationController

  before_action :logged_in_user, only: [:dashboard]
  
  def dashboard
    @users = User.find(current_user.following.ids)
    @activities = Activity.where(user_id: current_user.id).or(Activity.where(user_id: @users))
                          .paginate(page: params[:page], per_page: 10)
                          .order(created_at: :desc)
  end

  def about
  end

  def contact
  end
end
