FactoryGirl.define do  

	factory :enrollment do
    course_id 1
    user_id 1
  end

	factory :course do
		title "A Test Course"
		description "The testiest of courses"
		cost 399
		user_id 1
	end

	factory :section do
		title "Tester Course"
		course_id 1
		row_order 1
	end

	factory :lesson do
		title "This is the first test"
		subtitle "And this is the first part"
		row_order 1
		section_id 1
	end	

	factory :user do
		sequence :email do |n|
			"tester#{n}@gmail.com"
		end
		sequence :username do |n|
			"tester#{n}"
		end
		password "iloveLAMP"
		password_confirmation "iloveLAMP"
	end
end