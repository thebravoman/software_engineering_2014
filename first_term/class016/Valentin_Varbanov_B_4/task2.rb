require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:how_many_letters => "5",
			:expected=>
"<result>
<name>Denis Trenchev</name>
<name>Kalin Ivanov</name>
</result>
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:how_many_letters => "8",
			:expected=>
"<result>
<name>Borislav Nikov</name>
<name>Vladimir Yordanov</name>
</result>
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:how_many_letters => "6",
			:expected=>
"<result>
<name>Iliyan Germanov</name>
<name>Stefan Iliev</name>
</result>
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end

end
