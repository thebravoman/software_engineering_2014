require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:which_words => "that contain number",
			:expected=>
"<html>
<body>
<ol>
<li>app2le</li>
<li>he2r2e</li>
<li>numb12er</li>
</ol>
</body>
</html>
"
		}
		
		context1_2 = {
			:task_number=>"1",
			:which_words => "that do not contain number",
			:expected=>
"<html>
<body>
<ol>
<li>banana</li>
<li>hello</li>
<li>pie</li>
</ol>
</body>
</html>
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
