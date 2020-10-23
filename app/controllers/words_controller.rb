class WordsController < ApplicationController

  before_action :admin_log_in

  def index
    @word = Word.new
    render 'new'
  end

  def new
    @word = Word.new
  end

  def create
    abort
    @word = Word.new(word_params)
    if @word.save
      render 'categories/show'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def word_params
      params.require(:word).permit(:word, :category_id)
    end
end
