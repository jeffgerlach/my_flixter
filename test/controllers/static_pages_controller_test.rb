require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
    test "static pages index show" do 
   	get :index
   	assert_response :success
	end
end
