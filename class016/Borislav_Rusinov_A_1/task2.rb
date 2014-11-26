require_relative 'task.rb'

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:string=>"\"correct\"",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:format=>"HTML",
			:expected=>"<div class=\"students\">
						<ul>
							<li>Correct File</li>
						</ul>
					</div><div class=\"students\">
						<ul>
							<li>FirstName LastName</li>
						</ul>
					</div>"
		}
		
		context1_2 = {
			:task_number=>"1",
			:string=>"\"string\"",
			:which_to_sort=>"First Name",
			:in_what_order=>"DESC",
			:format=>"HTML",
			:expected=>
					"<div class=\"students\">
						<ul>
							<li>First String</li>
						</ul>
					</div><div class=\"students\">
						<ul>
							<li>Second String</li>
						</ul>
					</div>"
		}
		[context1_1,context1_2]
	end
	
	def initialize
		taskNumber = 2
		super 'task2.eruby'
	end
end
