require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:folder_or_csv=>"folder",
			:csv_or_folder=>"csv",
			:in_what_order2=>"ASC",
			:format=>"csv",
			:format_example=>"The_name_of_file_1,The_extention_of_file_1\nThe_name_of_file_2,The_extention_of_file_2\n...\nThe_name_of_file_N,The_extention_of_file_N\n",
			:expected=>
"Xfirst_Vlast_17,c
Afirst_Blast_13,pas
Gfirst_Klast_14,pas
Lfirst_Klast_10,rb
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:folder_or_csv=>"folder",
			:csv_or_folder=>"csv",
			:in_what_order2=>"ASC",
			:format=>"json",
			:format_example=>"{\n\"The_name_of_file_1\" : {\"extention\":\"The_extention_of_file_1\"},\n\"The_name_of_file_2\" : {\"extention\":\"The_extention_of_file_2\"},\n...\n}\n",
			:expected=>
"{
\"Xfirst_Vlast_17\" : {\"extention\":\"c\"},
\"Afirst_Blast_13\" : {\"extention\":\"pas\"},
\"Gfirst_Klast_14\" : {\"extention\":\"pas\"},
\"Lfirst_Klast_10\" : {\"extention\":\"rb\"},
}
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:folder_or_csv=>"folder",
			:csv_or_folder=>"csv",
			:in_what_order2=>"DESC",
			:format=>"xml",
			:format_example=>"<results>\n<file>\n<name>The_name_of_file_1</name><extention>The_extention_of_file_1</extention>\n</file>\n<file>\n<name>The_name_of_file_2</name><extention>The_extention_of_file_2</extention>\n</file>\n...\n</results>\n",
			:expected=>
"<results>
<file>
<name>Lfirst_Klast_10</name><extention>rb</extention>
</file>
<file>
<name>Gfirst_Klast_14</name><extention>pas</extention>
</file>
<file>
<name>Afirst_Blast_13</name><extention>pas</extention>
</file>
<file>
<name>Xfirst_Vlast_17</name><extention>c</extention>
</file>
</results>
"
		}
		
		context1_4 = {
			:task_number=>"1",
			:folder_or_csv=>"folder",
			:csv_or_folder=>"csv",
			:in_what_order2=>"DESC",
			:format=>"html",
			:format_example=>"<html>\n<body>\n<table>\n<tr><td>The_name_of_file_1</td><td>The_extention_of_file_1</td></tr>\n<tr><td>The_name_of_file_2</td><td>The_extention_of_file_2</td></tr>\n</table>\n</body>\n</html>\n",
			:expected=>
"<html>
<body>
<table>
<tr><td>Lfirst_Klast_10</td><td>rb</td></tr>
<tr><td>Gfirst_Klast_14</td><td>pas</td></tr>
<tr><td>Afirst_Blast_13</td><td>pas</td></tr>
<tr><td>Xfirst_Vlast_17</td><td>c</td></tr>
</table>
</body>
</html>
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
