require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context3_1 = {
			:task_number=>"3",
			:number=>"1000",
			:sort=>"ASC",
			:expected=>
"<ul>
  <li>777</li>
  <li>888</li>
  <li>999</li>
</ul>"
		}

		context3_2 = {
			:task_number=>"3",
			:number=>"500",
			:sort=>"DESC",
			:expected=>
"<ul>
  <li>412</li>
  <li>42</li>
  <li>12</li>
  <li>0</li>
</ul>"
		}

		[context3_1,context3_2]
	end
	
	def initialize
		super 'task3.eruby', 3
	end
	
end