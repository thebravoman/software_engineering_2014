require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:how_many=>"5",
			:what=>"odd numbers",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:what_file=>"csv",
			:to_expect=>

"		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN",
			:expected=>
"F5le3,L5le3"
		}
		
		context1_2 = {
			:task_number=>"1",
			:how_many=>"2",
			:what=>"odd numbers",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:what_file=>"csv",
			:to_expect=>
"		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN",
			:expected=>
"F5le2,L5le2
F10letter2,L10letter2
F10letters,L10letters
FirstName1,LastName1
FirstName3Invalid,LastName3Invalid
FirstName3,LastName3Invalid"
		}
		
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
