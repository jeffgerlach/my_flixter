require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
	test "section created" do 
   	 user = FactoryGirl.create(:user)
   	 sign_in user
   	 course = FactoryGirl.create(:course, user_id: user.id)
   	 section = FactoryGirl.build(:section, course_id: course.id)

   	 assert_difference 'Section.count' do
   	 	post :create, :course_id => course.id, :section => {title: section.title, row_order: 1}
   	 end
   	 assert_equal 1, course.sections.count
   	 assert_redirected_to instructor_course_path(course)#(user.courses.first)
   	
   end
end
