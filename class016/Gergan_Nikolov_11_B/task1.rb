require_relative "task.rb"

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"",
			:tag=>"<h1></h1>",
			:exmpl=>"<h1>15</h1>"
		}				
		
		context1_2 = {
			:task_number=>"",
			:tag=>"<p></p>",
			:exmpl=>"<p>15</p>"
		}
		
		context1_3 = {
			:task_number=>"",
			:tag=>"<b></b>",
			:exmpl=>"<b>15</b>"
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
