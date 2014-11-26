require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"2",
			:which_to_sort => "Initials",
			:in_what_order => "ASC",
			:file_type=>"html",
			:to_expect=>
				"<h1>FirstName1_LastName1</h1>
				<h2>initials1</h2t>
				<h1>FirstName2_LastName2</h1>
				<h2>initials2</h2>
				...
				<h1>FirstNameN_LastNameN</h1>
				<h2>initialsN</h2>",
			:expected=>
				"<h1>F5letter1_L5letter1.rb</h1>
				<h2>FL</h2>
				<h1>F10letter2_L10letter2.rb</h1>
				<h2>FL</h2>
				<h1>Petur_Georgiev.rb</h1>
				<h2>PG</h2>
				<h1>Metodi_Petrov.rb</h1>
				<h2>MP</h2>
				<h1>Nikola_Vasilev.rb</h1>
				<h2>NV</h2>
				<h1>FirstName3_LastName3.rb</h1>
				<h2>FL</h2>"
		}
		
		context1_2 = {
			:task_number=>"2",
			:which_to_sort => "Name",
			:in_what_order => "DESC",
			:file_type=>"xml",
			:to_expect=>
				"<name>FirstName1_LastName1</name>
				<int>initials1</int>
				<name>FirstName2_LastName2</name>
				<int>initials2</int>
				...
				<name>FirstNameN_LastNameN</name>
				<int>initialsN</int>",
			:expected=>
				"<name>F5letter1_L5letter1.rb</name>
				<int>FL</int>
				<name>F10letter2_L10letter2.rb</name>
				<int>FL</int>
				<name>Petur_Georgiev.rb</name>
				<int>PG</int>
				<name>Metodi_Petrov.rb</name>
				<int>MP</int>
				<name>Nikola_Vasilev.rb</name>
				<int>NV</int>
				<name>FirstName3_LastName3.rb</name>
				<int>FL</int>"
		}
		
		[context1_1,context1_2]

	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
