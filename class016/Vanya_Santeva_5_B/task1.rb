require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:more_or_less=>"more",
			:in_what_order=>"ASC",
			:format=>"csv",
			:format_example=>
"file1,30
file2,40
..
fileN,N
",
			:expected=>
"32lines.rb,32
sixtyfivelines.rb,65
"
		}

		context1_2 = {
			:task_number=>"1",
			:more_or_less=>"less",
			:in_what_order=>"DESC",
			:format=>"csv",
			:format_example=>
"file1,20
file2,10
..
fileN,N
",
			:expected=>
"forget.rb,11
never.rb,9
"
		}

		context1_3 = {
			:task_number=>"1",
			:more_or_less=>"less",
			:in_what_order=>"ASC",
			:format=>"csv",
			:format_example=>
"file1,10
file2,20
..
fileN,N
",
			:expected=>
"never.rb,9
forget.rb,11
"
		}

		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
