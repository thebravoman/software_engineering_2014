require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:number_comparison=>"less",
			:sorting=>"ASC",
			:expected=>"<file>Tn_Cn_2.rb</file><file>Fn_Ln_5.rb</file>"
		}
		
		context1_2 = {
			:task_number=>"1",
			:number_comparison=>"greater",
			:sorting=>"DESC",
			:expected=>"<file>Sn_Nn_13.rb</file><file>Fn_Ln_12.rb</file>"
		}
		
		context1_3 = {
			:task_number=>"1",
			:number_comparison=>"less",
			:sorting=>"DESC",
			:expected=>"<file>Fn_Ln_5.rb</file><file>Tn_Cn_2.rb</file>"
		}
		
		context1_4 = {
			:task_number=>"1",
			:number_comparison=>"greater",
			:sorting=>"ASC",
			:expected=>"<file>Fn_Ln_12.rb</file><file>Sn_Nn_13.rb</file>"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
