require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context2_1 = {
			:task_number=>"2",
			:odd_or_even=>"ODD",
			:sort=>"ASC",
			:expected=>
"<numbers>
  <number>9</number>
  <number>17</number>
  <number>123</number>
  <number>765</number>
  <number>12341</number>
</numbers>"
		}

		context2_2 = {
			:task_number=>"2",
			:odd_or_even=>"EVEN",
			:sort=>"DESC",
			:expected=>
"<numbers>
  <number>86</number>
  <number>42</number>
  <number>20</number>
  <number>14</number>
  <number>0</number>
</numbers>"
		}

		[context2_1,context2_2]
	end
	
	def initialize
		super 'task2.eruby', 2
	end
	
end