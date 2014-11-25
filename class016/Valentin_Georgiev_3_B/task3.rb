require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"3",
			:what_to_find=>"all the files from the folder that are in the format FirsrName_LastName_digits.rb.",
			:what_to_calculate=>"the length of their names (including extensions) multiplied by 5.",
			:which_to_sort => "lenth",
			:in_what_order => "ASC",
			:file_format=>"html",
			:to_expect=>
				"<h1>File1.rb</h1>
				<h2>30</h2>
				<h1>File2.rb</h1>
				<h2>35</h2>
				...
				<h1>FileN.rb</h1>
				<h2>40</h2>",				
			:expected=>
				"<h1>F5letter1_L5letter1_4.rb</h1>
				<h2>120</h2>
				<h1>F10letter2_L10letter2_29.rb</h1>
				<h2>135</h2>
				<h1>F10letter3_L10letter3_123.rb</h1>
				<h2>140</h2>
				<h1>FName_L10letters_6.rb</h1>
				<h2>105</h2>
				<h1>FirstName3Nikola_LastName5Georgiev_1.rb</h1>
				<h2>195</h2>
				<h1>FirstName3_LastName3Invalid.rb</h1>
				<h2>150</h2>
				<h1>invalid.rb</h1>
				<h2>50</h2>"
		}
		
		context1_2 = {
			:task_number=>"3",
			:what_to_find=>"all the files from the folder that are in the format FirsrName_LastName_digits.rb.",
			:what_to_calculate=>"the length of their names (including extensions) multiplied by 4.",
			:which_to_sort => "lenth",
			:in_what_order => "DESC",
			:file_format=>"csv",
			:to_expect=>
"				File1.rb,24
				File2.rb,28
				...
				FileN.rb,32",
			:expected=>
				"F5letter1_L5letter1_4.rb,120
				F10letter2_L10letter2_29.rb,135
				F10letter3_L10letter3_123.rb,140
				FName_L10letters_6.rb,105
				FirstName3Nikola_LastName5Georgiev_1.rb,195
				FirstName3_LastName3Invalid.rb,150
				invalid.rb,50"
		}
		
		[context1_1,context1_2]

	end
	
	def initialize
		super 'task3.eruby'
	end

end
