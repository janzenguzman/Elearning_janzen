class UsersController < ApplicationController
  
  before_action :logged_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :user_id, only: [:edit, :update, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back(fallback_location: request.referer)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_back(fallback_location: request.referer)
    else
      render 'edit'
    end
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
