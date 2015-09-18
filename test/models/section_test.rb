require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "next_section returns the next section" do
  	course = FactoryGirl.create(:course)
    section1 = FactoryGirl.create(:section, :course_id => course.id)
    section2 = FactoryGirl.create(:section, :course_id => course.id)

    assert section2, section1.next_section
  end
end
