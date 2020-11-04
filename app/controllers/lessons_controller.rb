class LessonsController < ApplicationController  
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words
    @user = current_user
    @lesson = Lesson.new
    abort
    redirect_to category_lessons_url
    # abort
  end

  def create
  end
end
