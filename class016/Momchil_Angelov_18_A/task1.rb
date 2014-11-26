require_relative 'task.rb'

class Task1 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"2",
			:length=>"6",
			:sort=>"DESC",
			:expected=>
"<root>
		<word>Putins</word>
		<word>Obamas</word>
		<word>Hellos</word>
</root>"
		}
		
		context1_2 = {
			:task_number=>"2",
			:length=>"5",
			:sort=>"ASC",
			:expected=>
"<root>
		<word>Hello</word>
		<word>Obama</word>
		<word>Putin</word>
</root>"
		}

		context1_3 = {
			:task_number=>"2",
			:length=>"5",
			:sort=>"DESC",
			:expected=>
"<root>
		<word>Putin</word>
		<word>Obama</word>
		<word>Hello</word>
</root>"
		}

		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby', 1
	end
	
end