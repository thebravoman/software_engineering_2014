require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context2_1 = {
			:task_number=>"2",
			:odd_or_even=>"odd",
			:sort=>"ASC",
			:expected=>
"..
"
		}

		context2_2 = {
			:task_number=>"2",
			:odd_or_even=>"even",
			:sort=>"DESC",
			:expected=>
"..
"
		}

		[context2_1,context2_2]
	end
	
	def initialize
		taskNumber = 2
		super 'task2.eruby', taskNumber
	end
	
end
