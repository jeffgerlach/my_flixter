require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course does not allow negative prices" do
  	assert_raises ActiveRecord::RecordInvalid do
    	course = FactoryGirl.create(:course, :cost => -1.99)
    end
  end

  test "course requires title" do
  	assert_raises ActiveRecord::RecordInvalid do
    	course = FactoryGirl.create(:course, :title => "")
    end
  end

  test "course requires description" do
  	assert_raises ActiveRecord::RecordInvalid do
    	course = FactoryGirl.create(:course, :description => "")
    end
  end

  test "course requires cost" do
  	assert_raises ActiveRecord::RecordInvalid do
    	course = FactoryGirl.create(:course, :cost => nil)
    end
  end

	test "free? returns course is free" do
  	course = FactoryGirl.create(:course, :cost => 0)
    assert course.free?
  end

	test "premium? returns course costs money" do
  	course = FactoryGirl.create(:course, :cost => 1.99)
    assert course.premium?
  end
end
