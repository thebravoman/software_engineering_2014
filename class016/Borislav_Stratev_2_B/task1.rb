require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:number=>"6",
			:order=>"ASC",
			:format=>"xml",
			:to_expect=>
				"Number is eqal to 6 there are only three combination for line numbers: 1,2,3 and lets say that all combinations are represented only once and we have ASC order.
				The following tree structure is required.
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
					<filename3>
						<numberoflines>
							3
						</numberoflines>
					</filename3>
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
			:number=>"4",
			:order=>"DESC",
			:format=>"json",
			:to_expect=>
				"Number is eqal to 4 there are only two combination for line numbers: 1,2 and lets say that all combinations are represented onlu once and we have DESC order.
				{filename2:[2],filename1:[1]}",		
			:expected=>
				"{filename2:[2],filename1:[1]}"	,		
			
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
