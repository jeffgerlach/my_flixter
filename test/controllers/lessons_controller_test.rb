require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "lesson show" do 
  	user = FactoryGirl.create(:user)
  	sign_in user
   	course = FactoryGirl.create(:course, :user_id => user.id)
   	enroll = FactoryGirl.create(:enrollment, :course_id => course.id, :user_id => user.id)
   	section = FactoryGirl.create(:section, :course_id => course.id)
   	lesson = FactoryGirl.create(:lesson, :section_id => section.id)
   	get :show, :id => lesson.id
   	assert_response :success
	end

	test "lesson show page not found" do
		user = FactoryGirl.create(:user)
  	sign_in user
   	course = FactoryGirl.create(:course, :user_id => user.id)
   	enroll = FactoryGirl.create(:enrollment, :course_id => course.id, :user_id => user.id)
   	section = FactoryGirl.create(:section, :course_id => course.id)
   	lesson = FactoryGirl.create(:lesson, :section_id => section.id)
    get :show, :id => 'OMG'
    assert_response :not_found
  end

  test "lesson show page not authorized" do
  	course = FactoryGirl.create(:course)
   	section = FactoryGirl.create(:section, :course_id => course.id)
   	lesson = FactoryGirl.create(:lesson, :section_id => section.id)
    get :show, :id => 'OMG'
    assert_redirected_to new_user_session_path
  end

end
