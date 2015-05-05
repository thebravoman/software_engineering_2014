require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"3",
			:what_to_find=>"the birth year of every student",
			:which_to_sort => "age",
			:in_what_order => "ASC",
			:expected=>
"<h1>FirstName</h1>
<h1>LastName</h1>
<h1>1965</h1>
<h1>First2</h1>
<h1>Last2</h1>
<h1>1985</h1>
<h1>First3</h1>
<h1>Last3</h1>
<h1>2000</h1>
"
		}
		
		context1_2 = {
			:task_number=>"3",
			:what_to_find=>"the birth year of every student",
			:which_to_sort => "First Name",
			:in_what_order => "ASC",
			:expected=>
"<h1>First2</h1>
<h1>Last2</h1>
<h1>1985</h1>
<h1>First3</h1>
<h1>Last3</h1>
<h1>2000</h1>
<h1>FirstName</h1>
<h1>LastName</h1>
<h1>1965</h1>
"
		}
		
		context1_3 = {
			:task_number=>"3",
			:what_to_find=>"the birth year of every student",
			:which_to_sort => "Last Name",
			:in_what_order => "ASC",
			:expected=>
"<h1>First2</h1>
<h1>Last2</h1>
<h1>1985</h1>
<h1>First3</h1>
<h1>Last3</h1>
<h1>2000</h1>
<h1>FirstName</h1>
<h1>LastName</h1>
<h1>1965</h1>




"
		}
		
		context1_4 = {
			:task_number=>"3",
			:what_to_find=>"the birth year of every student",
			:which_to_sort => "First Name",
			:in_what_order => "DESC",
"<h1>FirstName</h1>
<h1>LastName</h1>
<h1>1965</h1>
<h1>First2</h1>
<h1>Last2</h1>
<h1>1985</h1>
<h1>First3</h1>
<h1>Last3</h1>
<h1>2000</h1>

"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task3.eruby'
	end

end

