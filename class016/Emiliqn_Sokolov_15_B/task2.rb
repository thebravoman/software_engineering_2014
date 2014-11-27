require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"2",
			:what_to_find=>"12",
			:file_format => "xml",
			:expected=>
"
	<numbers><number>920496asd1010.rb</number></numbers>
"
		}
	
		context1_2 = {
			:task_number=>"2",
			:what_to_find=>"10",
			:file_format => "xml",
			:expected=>
"
	<numbers><number>234sd678887012</number></numbers>
"
		}
		
		context1_3 = {
			:task_number=>"2",
			:what_to_find=>"11",
			:file_format => "xml",
			:expected=>
"
	<numbers><number>123456780s11.rb</number></numbers>
"

		}
		[context1_1, context1_2, context1_3]
	end
	
	def initialize
		taskNumber = 2
		super 'task2.eruby', taskNumber
	end
	
end
