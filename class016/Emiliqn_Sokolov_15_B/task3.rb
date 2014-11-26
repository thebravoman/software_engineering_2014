require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"3",
			:find=>"Find all the students that have 5 letters in their second name;",
			:sort => "First name",
			:order => "ASC",
			:expected=>
"
<result>
	<student_name>["Kamen", "Iusuf"]</student_name>
</result>
"
		}
		
		context1_2 = {
			:task_number=>"3",
			:find=>"Find all the students that have 5 letters in their first name;",
			:sort => "First name",
			:order => "DESC",
			:expected=>
"
<result>
	<student_name>["Kamen", "Iusuf"]</student_name>
</result>
"
		}
				
		
		[context1_1,context1_2]
	end
	
	def initialize
		taskNumber = 3
		super 'task3.eruby', taskNumber
	end

end
