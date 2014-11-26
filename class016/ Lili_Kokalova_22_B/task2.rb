require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:which_name=>"First Name",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"<student>
	<firstName>FirstLetterFN1</firstName> 
	<lastName>LastName1</lastName>
</student>
<student>
	<firstName>FirstLetterFN4</firstName> 
	<lastName>LastName6</lastName>
</student>
<student>
	<firstName>FirstLetterFN8</firstName> 
	<lastName>LastName3</lastName>
</student>"
		}
		
		context1_2 = {
			:task_number=>"2",
			:which_name=>"First Name",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"<student>	
	<firstName>FirstLetterFN4</firstName>
	<lastName>LastName6<lastName>
</student>
<student>
	<firstName>FirstLetterFN8</firstName>
	<lastName>LastName3<lastName>
</student>
<student>
	<firstName>FirstLetterFN1</firstName>
	<lastName>LastName1<lastName>
</student>"
		}
		
		context1_3 = {
			:task_number=>"2",
			:which_name=>"Last Name",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"<student>
	<firstName>FirstName1<firstName> 
	<lastName>FirstLetterLN1<lastName>
</student>
<student>
	<firstName>FirstName4<firstName>
	<lastName>FirstLetterLN6<lastName>
</student>
<student>
	<firstName>FirstName8<firstName>
	<lastName>FirstLetterLN3<lastName>
</student>"
		}
		
		context1_4 = {
			:task_number=>"2",
			:which_name=>"Last Name",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"<student>
	<firstName>FirstName8<firstName>
	<lastName> FirstLetterLN3<lastName>
</student>
<student>
	<firstName>FirstName4<firstName>
	<lastName> FirstLetterLN6<lastName>
</student>
<student>
	<firstName>FirstName1<firstName>
	<lastName> FirstLetterLN1<lastName>
</student>"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
