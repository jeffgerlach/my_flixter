class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrolled_for_current_course, :only => [:show]

	def show
	rescue ActiveRecord::RecordNotFound 
		render :text => "404 Error - Course Not Found", :status => :not_found
	end

	private

	def require_enrolled_for_current_course
    if !current_user.enrolled_in?(current_lesson.section.course) && (current_user != current_lesson.section.course.user)
      redirect_to course_path(current_lesson.section.course), :alert => 'You are not enrolled in this course! Please enroll to gain access to lessons.'
    end
  rescue ActiveRecord::RecordNotFound 
		render :text => "404 Error - Course Not Found", :status => :not_found
  end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
