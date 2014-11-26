require_relative 'task.rb'

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:class=>"002",
			:which_format=>"csv",
			:expected=>
"Count = 43
"
		}
		
		context1_2 = {
			:task_number=>"2",
			:class=>"003",
			:which_format=>"html",
			:expected=>
"Count = 21
"
		}
		
		context1_3 = {
			:task_number=>"2",
			:class=>"004",
			:which_format=>"json",
			:expected=>
"Count = 44
"
		}
		
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
