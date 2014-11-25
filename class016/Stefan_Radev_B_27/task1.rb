require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:first_name_letters=>"5",
			:last_name_letters=>"10",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:expected=>
"F5le8,LastName1
First1,L10letter2
F5le2,LastName3
First3,L10letter4
First2,L10letter5
F5le3,LastName6"
		}
		
		context1_2 = {
			:task_number=>"1",
			:first_name_letters=>"5",
			:last_name_letters=>"10",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"F5le3,LastName6
First2,L10letter5
First3,L10letter4
F5le2,LastName3
First1,L10letter2
F5le8,LastName1"
		}
		
		context1_3 = {
			:task_number=>"1",
			:first_name_letters=>"10",
			:last_name_letters=>"5",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"First1,L5le6
First3,L5le3
F10letter4,LastName2
F10letter5,LastName5
F10letter7,LastName4
First8,L5le1"
		}
		
		context1_4 = {
			:task_number=>"1",
			:first_name_letters=>"10",
			:last_name_letters=>"5",
			:which_to_sort=>"First Name",
			:in_what_order=>"DESC",
			:expected=>
"First8,L5le1
F10letter7,LastName4
F10letter5,LastName5
F10letter4,LastName2
First3,L5le3
First1,L5le6"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
