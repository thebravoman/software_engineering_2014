require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:first_name_letters=>"5",
			:last_name_letters=>"10",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:expected=>
"<table>
	<tr>
		<td>F5le8,LastName1</td>
		<td>First1,L10letter2</td>
		<td>F5le2,LastName3</td>
		<td>First3,L10letter4</td>
		<td>First2,L10letter5</td>
		<td>F5le3,LastName6</td>
	</tr>
</table>"
		}
		
		context1_2 = {
			:task_number=>"1",
			:first_name_letters=>"5",
			:last_name_letters=>"10",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"<table>
	</tr>
		<td>F5le3,LastName6<td>
		<td>First2,L10letter5</td>
		<td>First3,L10letter4</td>
		<td>F5le2,LastName3</td>
		<td>First1,L10letter2</td>
		<td>F5le8,LastName1</td>
	</tr>
</table>"
		}
		
		context1_3 = {
			:task_number=>"1",
			:first_name_letters=>"10",
			:last_name_letters=>"5",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:expected=>
"<table>
	<tr>
		<td>First1,L5le6</td>
		<td>First3,L5le3</td>
		<td>F10letter4,LastName2</td>
		<td>F10letter5,LastName5</td>
		<td>F10letter7,LastName4</td>
		<td>First8,L5le1</td>
	</tr>
</table>"
		}
		
		context1_4 = {
			:task_number=>"1",
			:first_name_letters=>"10",
			:last_name_letters=>"5",
			:which_to_sort=>"First Name",
			:in_what_order=>"DESC",
			:expected=>
"<table>
	<tr>
		<td>First8,L5le1</td>
		<td>F10letter7,LastName4</td>
		<td>F10letter5,LastName5</td>
		<td>F10letter4,LastName2</td>
		<td>First3,L5le3</td>
		<td>First1,L5le6</td>
	</tr>
</table>"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
