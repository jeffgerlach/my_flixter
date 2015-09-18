require 'test_helper'

class CoursesControllerTest < ActionController::TestCase

  test "course show" do 
   	course = FactoryGirl.create(:course)
   	get :show, :id => course.id
   	assert_response :success
	end

	test "course show page not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end

end
