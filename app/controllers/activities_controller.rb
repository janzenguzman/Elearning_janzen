class ActivitiesController < ApplicationController
  def create
    @activity = @action.activity.new
    @activity.user = current_user
    @activity.save
    redirect_to @action
  end
end
