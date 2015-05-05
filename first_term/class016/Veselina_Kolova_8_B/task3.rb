require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"3",
			:what_to_find=>"all the files from the folder that are in the format FirsrName_LastName_digits.rb.",
			:what_to_calculate=>"the length of their names (including extensions) multiplied by 2.",
			:which_to_sort => "lenth",
			:in_what_order => "ASC",
			:file_format=>"xml",
			:to_expect=>
"			<file>File1.rb</file>
			<length>6</length>
			<file>File2.rb</file>
			<length>4</length>
			...
			<file>FileN.rb</file>
			<length>3</length>",
			:expected=>
"<file>F5le2_L5le2_1.rb</file>
<lenght>32</lenght>
<file>F5le3_L5le3_3.rb</file>
<lenght>32</lenght>
<file>F5le8_L5le1_1.rb</file>
<lenght>32</lenght>
<file>F10letter0_L10letter1_7.rb</file>
<lenght>52</lenght>
<file>F10letter2_L10letter2_6.rb</file>
<lenght>52</lenght>
<file>F10letter3_L10letter4_3.rb</file>
<lenght>52</lenght>
<file>F10letters_L10letters_8.rb</file>
<lenght>54</lenght>
<file>FirstName1_LastName1_8888.rb</file>
<lenght>56</lenght>
<file>FirstName2_LastName2_8888.rb</file>
<lenght>56</lenght>"
		}
		
		context1_2 = {
			:task_number=>"3",
			:what_to_find=>"all the files from the folder that are in the format FirsrName_LastName_digits.rb.",
			:what_to_calculate=>"the length of their names (including extensions) multiplied by 10.",
			:which_to_sort => "File Name",
			:in_what_order => "ASC",
			:file_format=>"html",
			:to_expect=>
"			<h1>File1.rb</h1>
			<h2>14</h2>
			<h1>File2.rb</h1>
			<h2>32</h2>
			...
			<h1>FileN.rb</h1>
			<h2>24</h2>",
			:expected=>
"<h1>F5le2_L5le2_1.rb</h1>
<h2>160</h2>
<h1>F5le3_L5le3_3.rb</h1>
<h2>160</h2>
<h1F5le8_L5le1_1.rb</h1>
<h2>160</h2>
<h1>F10letter0_L10letter1_7.rb</h1>
<h2>260</h2>
<h1>F10letter2_L10letter2_6.rb</h1>
<h2>260</h2>
<h1>F10letter3_L10letter4_3.rb</h1>
<h2>260</h2>
<h1>F10letters_L10letters_8.rb</h1>
<h2>270</h2>
<h1>FirstName1_LastName1_8888.rb</h1>
<h2>270</h2>
<h1>FirstName2_LastName2_8888.rb</h1>
<h2>270</h2>"
		}
		

		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task3.eruby'
	end

end
