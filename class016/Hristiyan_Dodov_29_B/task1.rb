require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:number_comparison=>"less",
			:sorting=>"ASC",
			:expected=>
"Tn_Cn_2.rb
Fn_Ln_5.rb
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:number_comparison=>"greater",
			:sorting=>"DESC",
			:expected=>
"Sn_Nn_13.rb
Fn_Ln_12.rb
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:number_comparison=>"less",
			:sorting=>"DESC",
			:expected=>
"Fn_Ln_5.rb
Tn_Cn_2.rb
"
		}
		
		context1_4 = {
			:task_number=>"1",
			:number_comparison=>"greater",
			:sorting=>"ASC",
			:expected=>
"Fn_Ln_12.rb
Sn_Nn_13.rb
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
