class Lessons::ActivitiesController < ActivitiesController
  before_action :set_action

  private
    def set_action
      @activity = Lesson.find(params[:lesson_id])
    end
end
