require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1"
			:more_or_less=>"more",
			:in_what_order=>"ASC",
			:expected=>
"32lines.rb,32
sixtyfivelines.rb,65
onehundred_lines.rb,100
"
		}

		context1_2 = {
			:task_number=>"1"
			:more_or_less=>"more",
			:in_what_order=>"DESC",
			:expected=>
"onehundred_lines.rb,100
sixtyfivelines.rb,65
32lines.rb,32
"
		}

		context1_1 = {
			:task_number=>"1"
			:more_or_less=>"less",
			:in_what_order=>"ASC",
			:expected=>
"oneliner.rb,1
lucky_Num.rb,7
never.rb,9
forget.rb,11
"
		}

		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
