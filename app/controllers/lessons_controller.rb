class LessonsController < ApplicationController  
  
  before_action :logged_in_user
  
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words
    @user = current_user
    @lesson = Lesson.new
    redirect_to new_category_lesson_answer_url
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)

    if @lesson.save
      redirect_to new_category_lesson_answer_url(@category, @lesson, page:1)
    else
      render 'new'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answer = @lesson.answers
    @category = Category.find(params[:category_id])
    @words = @category.words
  end
end
