require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context2_1 = {
			:task_number=>"2",
			:odd_or_even=>"ODD",
			:sort=>"ASC",
			:expected=>
"<numbers>
  <number>777</number>
  <number>1241</number>
  <number>9899</number>
</numbers>"
		}

		context2_2 = {
			:task_number=>"2",
			:odd_or_even=>"EVEN",
			:sort=>"DESC",
			:expected=>
"<numbers>
  <number>5123124</number>
  <number>1230</number>
  <number>412</number>
  <number>42</number>
  <number>12</number>
  <number>0</number>
</numbers>"
		}

		[context2_1,context2_2]
	end
	
	def initialize
		super 'task2.eruby', 2
	end
	
end