require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:how_many_letters => "5",
			:expected=>
"Denis,Trenchev
Kalin,Ivanov
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:how_many_letters => "8",
			:expected=>
"Vladimir,Yordanov
Borislav,Nikov
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task3.eruby'
	end

end
