require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:tag=>"<h1></h1>",
			:exmpl=>"<h1>15</h1>"
			:expected=>
"<sum>10</sum>
"
		}				
		
		context1_2 = {
			:task_number=>"1",
			:tag=>"<p></p>",
			:exmpl=>"<p>15</p>"
			:expected=>
"<sum>10</sum>
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:tag=>"<b></b>",
			:exmpl=>"<b>15</b>"
			:expected=>
"<sum>10</sum>
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
