require_relative 'task.rb'

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:in_what_order=>"ASC",
			:expected=>
"<html>
<body>
	<p>Petko Slaveikov</p>
	<p>Prestoslav Milusheev</p>
	<p>Name2Greaterthantwelve</p>
</body>
</html>
"
		}
		
		context1_2 = {
			:in_what_order=>"DESC",
			:expected=>
"<html>
<body>
	<p>Kitodar Dve</p>
	<p>Short Twelve</p>
	<p>Name Sec</p>
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
