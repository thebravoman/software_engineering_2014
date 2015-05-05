require_relative 'task.rb'

class Task1 < Task

	def init_contexts

		context1_1 = {
				:task_number=>"1",
				:what_range=>"1-15",
				:which_to_sort => "Last name",
				:in_what_order => "ASC",
		}

		context1_2 = {
				:task_number=>"1",
				:what_range=>"16-20",
				:which_to_sort => "First name",
				:in_what_order => "ASC",
		}
		
		context1_3 = {
				:task_number=>"1",
				:what_range=>"21-29",
				:which_to_sort => "First name",
				:in_what_order => "DESC",
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
	
end