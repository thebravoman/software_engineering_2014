require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number => ARGV[1],
			:letters => "3",
			:word => "more",
			:which_name => "Last",
			:which_to_sort => "First",
			:in_what_order => "ASC",
			:extension => "csv",
			:expected=>
"L4l4,F4l4
L5le5,F5le5
L6lel6,F6lel6
L7lele7,F7lele7
L8lelel8,F8lelel8
Ll3,Fl3
"
		
			}
		
		context1_2 = {
			:task_number => ARGV[1],
			:letters => "5",
			:word => "more",
			:which_name => "First",
			:which_to_sort => "Last",
			:in_what_order => "DESC",
			:extension => "csv",
			:expected =>
"L8lelel8,F8lelel8
L7lele7,F7lele7
L6lel6,F6lel6
L5le5,F5le5
"

		}
		
		context1_3 = {
			:task_number => ARGV[1],
			:letters => "7",
			:word => "less",
			:which_name => "Last",
			:which_to_sort => "First",
			:in_what_order => "DESC",
			:extension => "csv",
			:expected =>
"Ll3,Fl3
L7lele7,F7lele7
L6lel6,F6lel6
L5le5,F5le5
L4l4,F4l4
L2,F2
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
