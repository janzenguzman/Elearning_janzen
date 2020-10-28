class Admin::WordsController < ApplicationController

  before_action :admin_log_in

  def new
    @word = current_category.words.build
    3.times { @word.choices.build }
  end

  def create
    @word = current_category.words.build(word_params)

    if @word.save
      flash[:success] = "You have made a new word!"
      redirect_to new_admin_category_word_path(current_category)
    else
      flash[:danger] = "Something went wrong."
      redirect_to new_admin_category_word_path(current_category)
    end
  end

  private
    def word_params
      params.require(:word).permit(:word, :category_id, { choices_attributes: [:word_id, :choice] })
    end

    def current_category
      @category = Category.find(params[:category_id])
    end
end
