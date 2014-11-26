require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:letters=>"7",
			:which_name=>"first",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC"
		}
		
		context1_2 = {
			:task_number=>"1",
			:letters=>"10",
			:which_name=>"second",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC"
		}
		
		context1_3 = {
			:task_number=>"1",
			:letters=>"8",
			:which_name=>"second",
			:which_to_sort=>"First name",
			:in_what_order=>"DESC"
		}
		
		context1_4 = {
			:task_number=>"1",
			:letters=>"10",
			:which_name=>"first",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task2.eruby'
	end
end