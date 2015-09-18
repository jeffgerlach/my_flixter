require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
	test "user is enrolled to free course" do
  	user = FactoryGirl.create(:user)
   	sign_in user
   	course = FactoryGirl.create(:course, :cost => 0)  #assume not premium to get around Stripe until it's stubbed out

   	
		assert_difference 'Enrollment.count' do
   	 	post :create, :course_id => course.id
   	end
   	 assert_equal 1, user.enrollments.count
   	 assert_redirected_to course_path(course)
  end

end
