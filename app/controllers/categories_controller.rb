class CategoriesController < ApplicationController

  before_action :admin_log_in

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)
    if @category.save
      flash[:success] = "New category created."
      redirect_to categories_url
    else
      render 'new'
    end
  end

  private
    def cat_params
      params.require(:category).permit(:title, :description)
    end
end
