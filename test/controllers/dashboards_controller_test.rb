require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
	test "dashboard doesn't show to unauthenticated user" do 
   	get :show
   	assert_redirected_to new_user_session_path
	end

	test "dashboard shows to authenticated user" do 
		user = FactoryGirl.create(:user)
		sign_in user
   	get :show
   	assert_response :success
	end
end
