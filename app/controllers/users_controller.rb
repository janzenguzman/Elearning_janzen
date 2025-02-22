class UsersController < ApplicationController
  
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :user_id, only: [:edit, :update, :show, :following, :followers]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account sucessfully made! You can now login."
      redirect_to login_url
    else
      flash[:danger] = "Double check, there seem to be an error."
      render 'new'
    end
  end

  def show
    @activities = @user.activities.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile have been edited!"
      redirect_back(fallback_location: request.referer)
    else
      flash[:danger] = "Double check, there seem to be an error."
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    @user.destroy
    redirect_back(fallback_location: request.referer)
  end

  def following
    @title = "Following"
    @users = @user.following.all
    @all_users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.all
    @all_users = @user.followers
    render 'show_follow'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_id
      @user = User.find(params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to root_url
      end
    end
end
