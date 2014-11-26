require_relative 'task.rb'

class Task2 < Task

	def init_contexts
		context1_1 = {
		:task_number =>"",
		:what_to_find =>"the length of the students first name",
		:which_to_sort => "First Name",
		:in_what_order => "ASC",
		:expected=>""
		},

		context1_2 = {
		:task_number =>"",
		:what_to_find =>"the length of the students first name",
		:which_to_sort => "First name",
		:in_what_order => "DESC",
		:expected=>""
		}
		[context1_1,context1_2]
	end

	def initialize
		super 'task2.eruby'
	end
end
