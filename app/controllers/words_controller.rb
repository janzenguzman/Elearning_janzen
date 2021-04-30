class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @answers = current_user.answers.paginate(page: params[:page], per_page: 20)
    @lessons = current_user.lessons
  end
end
