require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:folder=>"class014_homework",
			:flog_number=>"200",
			:sort=>"firstname",
			:expected=>
"FirstName1,LastName1,Flog1
FirstName2,LastName2,Flog2
FirstNameN,LastNameN,FlogN
"
		}

		context1_2 = {
			:task_number=>"1",
			:folder=>"class014_homework",
			:flog_number=>"300",
			:sort=>"flog result",
			:expected=>
"FirstName1,LastName1,Flog1
FirstName2,LastName2,Flog2
FirstNameN,LastNameN,FlogN
"
		}

		context1_3 = {
			:task_number=>"1",
			:folder=>"class015_homework",
			:flog_number=>"200",
			:sort=>"firstname",
			:expected=>
"FirstName1,LastName1,Flog1
FirstName2,LastName2,Flog2
FirstNameN,LastNameN,FlogN
"
		}

		context1_4 = {
			:task_number=>"1",
			:folder=>"class015_homework",
			:flog_number=>"300",
			:sort=>"flog result",
			:expected=>
"FirstName1,LastName1,Flog1
FirstName2,LastName2,Flog2
FirstNameN,LastNameN,FlogN
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end