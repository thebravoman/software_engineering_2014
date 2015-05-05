require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:which_name=>"First Name",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"FirstLetterFN1, LastName1
FirstLetterFN4, LastName6
FirstLetterFN8, LastName3"
		}
		
		context1_2 = {
			:task_number=>"2",
			:which_name=>"First Name",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"FirstLetterFN4, LastName6
FirstLetterFN8, LastName3
FirstLetterFN1, LastName1"
		}
		
		context1_3 = {
			:task_number=>"2",
			:which_name=>"Last Name",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"FirstName1, FirstLetterLN1
FirstName4, FirstLetterLN6
FirstName8, FirstLetterLN3"
		}
		
		context1_4 = {
			:task_number=>"2",
			:which_name=>"Last Name",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"FirstName8, FirstLetterLN3
FirstName4, FirstLetterLN6
FirstName1, FirstLetterLN1"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
