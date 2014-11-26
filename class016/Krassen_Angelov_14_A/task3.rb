require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number => ARGV[2],
			:letters => "3",
			:symbols => "_",
			:which_to_sort => "Length",
			:in_what_order => "ASC",
			:extension => "json",
			:expected => 
"{
	\"F1_l_l_3.xml\":\"12\"
	\"F2_l_l_3.csv\":\"12\"
}
"
		}
		
		context1_2 = {
			:task_number => ARGV[2],
			:letters => "3",
			:symbols => "-",
			:which_to_sort => "File Name",
			:in_what_order => "DESC",
			:extension => "json",
			:expected =>
"{
	\"F2-l-l-3.cpp\":\"12\"
	\"F1-l-l-3.cc\":\"11\"
}
"
		}
		
		context1_3 = {
			:task_number => ARGV[2],
			:letters => "2",
			:symbols => "_",
			:which_to_sort => "Length",
			:in_what_order => "DESC",
			:extension => "json",
			:expected =>
"{
	\"F2_l_2.txt\":\"10\"
	\"F1_l_2.com\":\"10\"
}
"
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task3.eruby'
	end

end
