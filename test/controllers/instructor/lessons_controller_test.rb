require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
	test "lesson created" do 
   	 user = FactoryGirl.create(:user)
   	 sign_in user
   	 course = FactoryGirl.create(:course, user_id: user.id)
   	 section = FactoryGirl.create(:section, course_id: course.id)
   	 lesson = FactoryGirl.build(:lesson)

   	 assert_difference 'Lesson.count' do
   	 	post :create, :section_id => section.id, :lesson => {title: lesson.title, subtitle: lesson.subtitle, row_order: 1}
   	 end
   	 assert_equal 1, lesson.section.lessons.count
   	 assert_redirected_to instructor_course_path(lesson.section.course)
   	
   end
end
