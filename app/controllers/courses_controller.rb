class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	rescue ActiveRecord::RecordNotFound 
			render :text => "404 Error - Course Not Found", :status => :not_found
	end

end
