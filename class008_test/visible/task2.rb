require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:what_to_find=>"the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different",
			:which_to_sort => "Last name",
			:in_what_order => "ASC",
			:expected=>
"L5le1,F5le8
L5le2,F5le2
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:what_to_find=>"the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different",
			:which_to_sort => "Last name",
			:in_what_order => "DESC",
			:expected=>
"L5le3,F5le3
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:what_to_find=>"the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:expected=>
"L5le4,F5le4
LastName3,FirstName3
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
