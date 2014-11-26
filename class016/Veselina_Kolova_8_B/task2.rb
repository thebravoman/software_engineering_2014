require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"2",
			:which_to_sort => "Name",
			:in_what_order => "ASC",
			:file_type=>"xml",
			:to_expect=>
"	<name>FirstName1_LastName1</name>
	<int>initials1</int>
	<name>FirstName2_LastName2</name>
	<int>initials2</int>
	...
	<name>FirstNameN_LastNameN</name>
	<int>initialsN</int>",
			:expected=>
"<name>F5le2_L5le2</name>
<int>FL</int>
<name>F5le3_L5le3</name>
<int>FL</int>
<name>F5le8_L5le1</name>
<int>FL</int>
<name>F10letter0_L10letter1</name>
<int>FL</int>
<name>F10letter0_L10letter</name>
<int>FL</int>
<name>F10letter2_L10letter2</name>
<int>FL</int>
<name>F10letter3_L10letter4</name>
<int>FL</int>
<name>FirstName1_LastName1</name>
<int>FL</int>
<name>FirstName2_LastName2</name>
<int>FL</int>"
		}
		
		context1_2 = {
			:task_number=>"2",
			:which_to_sort => "Initials",
			:in_what_order => "DESC",
			:file_type=>"xml",
			:to_expect=>
"	<name>FirstName1_LastName1</name>
	<int>initials1</int>
	<name>FirstName2_LastName2</name>
	<int>initials2</int>
	...
	<name>FirstNameN_LastNameN</name>
	<int>initialsN</int>",
			:expected=>
"name>F5le2_L5le2</name>
<int>FL</int>
<name>F5le3_L5le3</name>
<int>FL</int>
<name>F5le8_L5le1</name>
<int>FL</int>
<name>F10letter0_L10letter1</name>
<int>FL</int>
<name>F10letter0_L10letter</name>
<int>FL</int>
<name>F10letter2_L10letter2</name>
<int>FL</int>
<name>F10letter3_L10letter4</name>
<int>FL</int>
<name>FirstName1_LastName1</name>
<int>FL</int>
<name>FirstName2_LastName2</name>
<int>FL</int>
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
