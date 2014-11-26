require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:condition=>"more expensive than",
			:value=>"10 dollars",
			:in_what_order=>"ASC",
			:expected=>
"Always,Name1,Sisisa,Yoyo
"
		}

		context1_2 = {
			:task_number=>"1",
			:condition=>"cheaper than",
			:value=>"15 dollars",
			:in_what_order=>"DESC",
			:expected=>
"Nil,Cheap
"
		}

		context1_3 = {
			:task_number=>"1",
			:condition=>"released after",
			:value=>"2000",
			:in_what_order=>"ASC",
			:expected=>
"Always,Cheap,Name1,Sisisa
"
		}

		context1_4 = {
			:task_number=>"1",
			:condition=>"released before",
			:value=>"2007",
			:in_what_order=>"DESC",
			:expected=>
"Yolo,Sisisa,Nil,Name1,Always
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
