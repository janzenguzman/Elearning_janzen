class Admin::CategoriesController < ApplicationController

  before_action :admin_log_in
  before_action :cat_id, only: [:edit, :update, :show]

  def index
    @category = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    if @category.save
      flash[:success] = "New category created."
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def show
    @words = cat_id.words.all
  end

  def edit
  end

  def update
    if @category.update(cat_params)
      flash[:success] = "Category updated."
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    @category.destroy
    flash[:danger] = "Category deleted."
    redirect_back(fallback_location: request.referer)
  end

  private
    def cat_params
      params.require(:category).permit(:title, :description)
    end

    def cat_id
      @category = Category.find(params[:id])
    end
end
