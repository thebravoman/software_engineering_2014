require_relative 'task.rb'

class Task3 < Task

	def init_contexts
		
		context1_1 = {
			:task_number=>"3",
			:number=>"10",
			:name=>"first",
			:in_what_order1=>"ASC",
			:format=>"xml",
			:format_example=>"<results>\n<student>\n<FirstName>F1</FirstName>\n<LastName>L1</LastName>\n<extention>TheExtentionOfTheFile</extention>\n</student>\n...\n</results>",
			:expected=>
"<results>
<student> 
<FirstName>bbbbbbbbbb</FirstName>
<LastName>aaaaa</LastName>
<extention>c</extention>
</student>
<student>
<FirstName>aaaaaaaaaa</FirstName>
<LastName>aaaaa</LastName>
<extention>rb</extention>
</student>
</results>
"
		}
		
		context1_2 = {
			:task_number=>"3",
			:number=>"10",
			:name=>"first",
			:in_what_order1=>"DESC",
			:format=>"xml",
			:format_example=>"<results>\n<student>\n<FirstName>F1</FirstName>\n<LastName>L1</LastName>\n<extention>TheExtentionOfTheFile</extention>\n</student>\n...\n</results>",
			:expected=>
"<results>
<student>
<FirstName>aaaaaaaaaa</FirstName>
<LastName>aaaaa</LastName>
<extention>rb</extention>
</student>
<student> 
<FirstName>bbbbbbbbbb</FirstName>
<LastName>aaaaa</LastName>
<extention>c</extention>
</student>
</results>
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task3.eruby'
	end
end
