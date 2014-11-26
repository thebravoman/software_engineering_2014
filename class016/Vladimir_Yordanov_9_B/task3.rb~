require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:in_what_order=>"ASC",
			:expected=>
"<html>
<body>
	<p>AhisEquals Fifte</p>
	<p>ThisName Fifteen</p>

</body>
</html>
"
		}
		
		context1_2 = {
			:in_what_order=>"DESC",
			:expected=>
"<html>
<body>
	<p>ThisName,Fifteen</p>
	<p>AhisEquals,Fifte</p>
</body>
</html>
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task3.eruby'
	end
end
