require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:c_or_rb => "c",
			:one_two => "2",
			:format => "csv",
			:expected=>
"Iosyf_Saleh_12.c,"
		}
		
		context1_2 = {
			:task_number=>"1",
			:c_or_rb => "c",
			:one_two => "1",
			:format => "csv",
			:expected=>
"Fun_imation.c"
		}
		
		context1_3 = {
			:task_number=>"1",
			:c_or_rb => "rb",
			:one_two => "1",
			:format => "csv",
			:expected=>
"Sha_ft.rb"
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		taskNumber = 1
		super 'task1.eruby', taskNumber
	end
end
