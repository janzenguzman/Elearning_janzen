class AnswersController < ApplicationController
  
  before_action :logged_in_user
  before_action :category_id
  before_action :lesson_id
  
  def new
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @answer = Answer.new
  end

  def create
    @choice = Choice.find(params[:choice_id])
    @answers = @lesson.answers.build(answer_params)
    # abort
    if @lesson.save
      unless params[:page].empty?
        redirect_to new_category_lesson_answer_url(@category, @lesson, page: params[:page])
      else
        result = 0
        @lesson.answers.each do |answer|
          if answer.choice.is_correct?
            result += 1
          end
          @lesson.update_attributes(:result => result, :is_completed => true)
        end
        redirect_to category_lesson_url(@category, @lesson)
      end
    end
  end

  private
    def answer_params
      params.permit(:word_id, :choice_id, :lesson_id)
    end

    def category_id
      @category = Category.find(params[:category_id])
    end

    def lesson_id
      @lesson = Lesson.find(params[:lesson_id])
    end
end
