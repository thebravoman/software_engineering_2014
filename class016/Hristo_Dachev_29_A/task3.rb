require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:grades=>"5",
			:name=>"6",
			:sort=>"ASC",
			:expected=>""
		}

		context1_2 = {
			:task_number=>"1",
			:grades=>"4",
			:name=>"5",
			:sort=>"DESC",
			:expected=>""
		}

		context1_3 = {
			:task_number=>"1",
			:grades=>"7",
			:name=>"6",
			:sort=>"DESC",
			:expected=>""
		}

		context1_4 = {
			:task_number=>"1",
			:grades=>"3",
			:name=>"10",
			:sort=>"ASC",
			:expected=>""
		}

		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby', 1
	end
end