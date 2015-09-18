require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is added successfully" do
  	assert_difference "User.count" do
    	user = FactoryGirl.create(:user)
    end
  end

  test "user won't be added if username blank" do
  	assert_raises ActiveRecord::RecordInvalid do
    	user = FactoryGirl.create(:user, :username => "")
    end
  end

  test "user won't be added if email blank" do
  	assert_raises ActiveRecord::RecordInvalid do
    	user = FactoryGirl.create(:user, :email => "")
    end
  end

  test "user won't be added if password blank" do
  	assert_raises ActiveRecord::RecordInvalid do
    	user = FactoryGirl.create(:user, :password => "")
    end
  end

  test "user won't be added if password less than 8 characters" do
  	assert_raises ActiveRecord::RecordInvalid do
    	user = FactoryGirl.create(:user, :password => "1234567")
    end
  end

end
