class Admin::WordsController < ApplicationController

  before_action :admin_log_in

  def new
    @word = current_category.words.build
  end

  def create
    @word = current_category.words.build(word_params)

    if @word.save
      flash[:success] = "You have made a new word!"
      redirect_to new_admin_category_word_path(current_category)
    else
      flash[:danger] = "Something is wrong."
      render 'new'
    end
  end

  private
    def word_params
      params.require(:word).permit(:word, :category_id)
    end

    def current_category
      @category = Category.find(params[:category_id])
    end
end
