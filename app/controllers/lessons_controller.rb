class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_before_access_lessons
  def show
    
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_enrollment_before_access_lessons
    if !current_user.enrolled_in?(current_lesson.section.course)
      return redirect_to course_path(current_lesson.section.course), alert: 'Please enroll in the course first!'
    end
  end
end
