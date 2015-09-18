require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "next_lesson returns the next lesson in same section" do
  	course = FactoryGirl.create(:course)
    section = FactoryGirl.create(:section, :course_id => course.id)
    lesson1 = FactoryGirl.create(:lesson, :section_id => section.id)
    lesson2 = FactoryGirl.create(:lesson, :section_id => section.id)

    assert lesson2, lesson1.next_lesson
  end

  test "next_lesson returns the next lesson in different section" do
  	course = FactoryGirl.create(:course)
    section1 = FactoryGirl.create(:section, :course_id => course.id)
    section2 = FactoryGirl.create(:section, :course_id => course.id)
    lesson1 = FactoryGirl.create(:lesson, :section_id => section1.id)
    lesson2 = FactoryGirl.create(:lesson, :section_id => section2.id)

    assert lesson2, lesson1.next_lesson
  end
end
