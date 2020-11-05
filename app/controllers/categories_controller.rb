class CategoriesController < ApplicationController
  
  before_action :logged_in_user
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @lessons = Lesson.all
    @lesson = Lesson.new
  end
end
