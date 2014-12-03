require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:word=>"software",
			:format=>"csv",
			:in_what_order=>"ASC",
			:format_example=>
"file1,3
file2,10
..
fileN,N",
			:expected=>
"forget.rb,0
mlqko.rb,2
nesquik.rb,4
never.rb,6"
		}

		context1_2 = {
			:task_number=>"1",
			:word=>"hardware",
			:format=>"xml",
			:in_what_order=>"ASC",
			:format_example=>
"<results>
<file1.rb>3</file1.rb>
<file2.rb>6</file2.rb>
..
</results>",
			:expected=>
"<results>
<never.rb>3</never.rb>
<mlqko.rb>4</mlqko.rb>
<forget.rb>4</forget.rb>
<nesquik.rb>8</nesquik.rb>
</results>"
		}

		context1_3 = {
			:task_number=>"1",
			:word=>"tues",
			:format=>"json",
			:in_what_order=>"ASC",
			:format_example=>
"\"file1.rb\":N,\"file2.rb\":N ..",
			:expected=>
"\"never.rb\":1,\"mlqko.rb\":3,\"forget\":6,\"nesquik.rb\":6"
		}

		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
