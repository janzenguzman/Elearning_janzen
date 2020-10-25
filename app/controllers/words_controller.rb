class WordsController < ApplicationController

  before_action :admin_log_in

  def index
    @word = Word.new
    render 'new'
  end

  def new
    @word = Word.new
    @cat_id = params[:id]
    @word.category_id = @cat_id
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = "this is temporary: word created"
      redirect_to new_word_url(@word.category_id)
    else
      # abort
      flash[:danger] = "this is temporary: something caused an error"
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
