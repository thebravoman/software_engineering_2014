require_relative 'task.rb'
class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"2",
			:number=>"1",
			:order=>"ASC",
			:format=>"xml",
			:to_expect=>
				"
				<results>	
					<filename2>
						<numberoflines>
							2
						</numberoflines>
					</filename2>
					
						...
					<filenamen>
						<numberoflines>
							n
						</numberoflines>
					</filenamem>
				</results>",
			:expected=>
				"<results>	
					<filename2>
						<numberoflines>
							2
						</numberoflines>
					</filename2>
					<filename3>
						<numberoflines>
							3
						</numberoflines>
					</filename3>
				</results>"

		}
		
		context1_2 = {
			:task_number=>"2",
			:number=>"0",
			:order=>"DESC",
			:format=>"json",
			:to_expect=>
				"{\"filenameN\":[n],..,\"filename1\":[1]}",		
			:expected=>
				"{\"filename3\":[3],\"filename2\":[2],\"filename1\":[1]}"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
