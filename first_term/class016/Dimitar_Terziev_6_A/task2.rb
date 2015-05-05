require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:how_many_letters=>"5",
			:what_name=>"first",
			:which_to_sort => "last name",
			:in_what_order => "ASC",
			:expected=>
%q[
	{
		"students_with_5_letters": {
			"student": [
					{
						"first_name": Petar, 
						"last_name": First, 
						"class": A, 
						"number": 2
					},
					{
						"first_name": First, 
						"last_name": LastNam, 
						"class": A, 
						"number": 5
					},
					{
						"first_name": Pesho, 
						"last_name": Mesho, 
						"class": A, 
						"number": 12
					}
				]
			}
		}
	}]
		}

		context1_2 = {
			:task_number=>"1",
			:how_many_letters=>"10",
			:what_name=>"last",
			:which_to_sort => "first name",
			:in_what_order => "DESC",
			:expected=>
%q[	{
		"students_with_10_letters": {
			"student": [
				{
					"first_name": Name, 
					"last_name": LastName12, 
					"class": B, 
					"number": 10
				}
			]
		}
	}]
		}

		context1_3 = {
			:task_number=>"1",
			:how_many_letters=>"7",
			:what_name=>"first",
			:which_to_sort => "first name",
			:in_what_order => "DESC",
			:expected=>
%q[	{
		"students_with_7_letters": {
			"student": [
				{
					"first_name": Strinka, 
					"last_name": Babcheva, 
					"class": A, 
					"number": 12
				}
			]
		}
	}]
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
