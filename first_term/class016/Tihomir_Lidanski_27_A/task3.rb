require_relative 'task.rb'

class Task1 < Task

	def init_contexts

		context1_1 = {
				:task_number=>"1",
				:letters=>"5",
				:which_to_sort => "Last name",
				:in_what_order => "ASC",
		}

		context1_2 = {
				:task_number=>"1",
				:letters=>"12",
				:which_to_sort => "First name",
				:in_what_order => "ASC",
		}
		
		context1_3 = {
				:task_number=>"1",
				:letters=>"6",
				:which_to_sort => "First name",
				:in_what_order => "DESC",
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task3.eruby'
	end
	
end