require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:number=>"0",
			:in_what_order=>"ASC",
			:expected=>
"<html>
<body>
	<p>Aletko</p>
	<p>Anastas</p>
	<p>Bastion</p>
	<p>Ceco</p>
	<p>Prestoslav</p>
</body>
</html>
"
		}
		
		context1_2 = {
			:number=>"1",
			:in_what_order=>"DESC",
			:expected=>
"<html>
<body>
	<p>Name</p>
	<p>Peshko</p>
	<p>SomeoneElse</p>
</body>
</html>
"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
