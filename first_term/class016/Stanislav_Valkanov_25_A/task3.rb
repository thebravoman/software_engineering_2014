require_relative 'task.rb'

class Task3 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:class=>"class012",
			:which_format=>"csv",
			:expected=>
"Count = 43
"
		}
		
		context1_2 = {
			:task_number=>"2",
			:class=>"class007",
			:which_format=>"html",
			:expected=>
"Count = 21
"
		}
		
		
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task3.eruby'
	end
end
