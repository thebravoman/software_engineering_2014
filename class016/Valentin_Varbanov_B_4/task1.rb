require_relative 'task.rb'

class Task1 < Task

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
"Borislav,Nikov
Vladimir,Yordanov
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:how_many_letters => "6",
			:expected=>
"Iliyan,Germanov
Stefan,Iliev
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end

end
