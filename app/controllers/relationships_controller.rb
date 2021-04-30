class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    @relationship = current_user.follow(@user)
    @relationship.create_activity(user: current_user)
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_back(fallback_location: request.referer)
  end
end
