require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context2_1 = {
			:task_number=>"2",
			:tag=>"td",
			:sort=>"DESC",
			:expected=>
"Table1,
Table2,
Table3,"
		}
		
		context2_2 = {
			:task_number=>"2",
			:tag=>"li",
			:sort=>"ASC",
			:expected=>
"List1,
List2,
List3"
		}

		context2_3 = {
			:task_number=>"2",
			:tag=>"p",
			:sort=>"DESC",
			:expected=>
"Paragraf1,
Paragraf2,
Paragraf3"
		}

		[context2_1,context2_2,context2_3]
	end
	
	def initialize
		super 'task2.eruby', 2
	end
	
end