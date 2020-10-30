class Admin::WordsController < ApplicationController

  before_action :admin_log_in
  before_action :current_category
  before_action :current_word, only: [:edit, :update, :destroy]

  def new
    @word = current_category.words.build
    3.times { @word.choices.build }
  end

  def create
    @word = Word.new(word_params)
    @word.category_id = params[:category_id]

    if @word.save
      flash[:success] = "You have made a new word!"
      redirect_to new_admin_category_word_url(current_category)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_word.update_attributes(word_params)
      flash[:success] = "Word UPDATED!"
      redirect_to admin_category_url(current_category)
    else
      render 'edit'
    end
  end

  def destroy
    @word = current_word.destroy
    @word.destroy
    flash[:danger] = "Word deleted."
    redirect_back(fallback_location: request.referer)
  end

  private
    def word_params
      params.require(:word).permit(:word, :category_id, { choices_attributes: [:id, :word_id, :choice, :is_correct] })
    end

    def current_category
      @category = Category.find(params[:category_id])
    end

    def current_word
      @word = Word.find(params[:id])
    end
end
