require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:which_to_sort => "first name",
			:in_what_order => "ASC",
			:output_format => "csv",
			:example_output => 
"First_Name_5.rb
			Gadno_Ime_10.rb",
			:expected=>
"Pesho_Peshev_5.rb
"
		}
		
		[context1_1]
	end
	
	def initialize
		super 'task3.eruby'
	end

end