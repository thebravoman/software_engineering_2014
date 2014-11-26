require_relative "task.rb"

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"",
			:tag=>"length"
		}				
		
		context1_2 = {
			:task_number=>"",
			:tag=>"ASC"			
		}
		
		context1_3 = {
			:task_number=>"",
			:tag=>"DESC"
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
