require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:number=>"4",
			:order=>"ASC",
			:format=>"xml",
			:to_expect=>
				"
				<results>	
					<filename1>
						<numberoflines>
							1
						</numberoflines>
					</filename1>
					<filename2>
						<numberoflines>
							2
						</numberoflines>
					</filename2>
						.........
					<filenameN>
						<numberoflines>
							n
						</numberoflines>
					</filenameN>
				</results>",
			:expected=>
				"<results>	
					<filename1>
						<numberoflines>
							1
						</numberoflines>
					</filename1>
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
			:task_number=>"1",
			:number=>"3",
			:order=>"DESC",
			:format=>"json",
			:to_expect=>
				"{filenameN:[n],..,filename1:[1]}",		
			:expected=>
				"{filename2:[2],filename1:[1]}"	,		
			
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
