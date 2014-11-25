require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:odd_or_even=>"odd",
			:sort=>"ASC",
			:expected=>
"..
"
		}

		context1_2 = {
			:task_number=>"1",
			:odd_or_even=>"even",
			:sort=>"DESC",
			:expected=>
"..
"
		}

		[context1_1,context1_2]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
