class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_before_access_lessons
  def show
    ### Workable code in controller to implement next lesson function
    ### Not very good; better to include method in Lessons model so we can get the next lesson in any other controller
 #   section = current_lesson.section
 #   lessons = section.lessons.rank(:row_order)
 #   if lessons.index(current_lesson) <= lessons.length
 #     @next_lesson = lessons[lessons.index(current_lesson) + 1]
 #   else
 #     @next_lesson = nil
 #   end
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
