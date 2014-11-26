require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:how_many=>"3",
			:what=>"odd numbers",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:what_file=>"csv",
			:to_expect=>
				"FirstName1,LastName1
				FirstName2,LastName2
				...
				FirstNameN,LastNameN",
			:expected=>
				"F5letter1,L5letter
				F10letter2,L10letter2
				F10letter3,L10letter3
				FirstName3Nikola,LastName4Georgiev
				FirstName3,LastName3Invalid"

		}
		
		context1_2 = {
			:task_number=>"1",
			:how_many=>"6",
			:what=>"odd numbers",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:what_file=>"csv",
			:to_expect=>
				"FirstName1,LastName1
				FirstName2,LastName2
				...
				FirstNameN,LastNameN",
			:expected=>
				"F5letter1,L5letter
				F10letter2,L10letter2
				F10letter3,L10letter3
				FirstName3Nikola,LastName4Georgiev
				FirstName3,LastName3Invalid"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
