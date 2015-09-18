require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
   test "course created" do 
   	 user = FactoryGirl.create(:user)
   	 sign_in user
   	 course = FactoryGirl.build(:course, :user_id => user.id)

   	 assert_difference 'Course.count' do
   	 	post :create, :course => {title: course.title, description: course.description, cost: course.cost}
   	 end
   	 assert_equal 1, user.courses.count
   	 assert_redirected_to instructor_course_path(user.courses.first)
   end
end
