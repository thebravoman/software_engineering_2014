require_relative 'task.rb'

class Task2 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:word=>"software",
			:format=>"csv",
			:format_example=>
"file1,3
file2,10
..
fileN,N",
			:expected=>
"never.rb,6
sixtyfivelines.rb,4
32lines.rb,2
forget.rb,0
"
		}

		context1_2 = {
			:task_number=>"1",
			:word=>"hardware",
			:format=>"xml",
			:format_example=>
"<results>
<file1.rb>3</file1.rb>
<file2.rb>6</file2.rb>
..
</results>
",
			:expected=>
"<results>
<never.rb>3</never.rb>
<32lines.rb>4</32lines.rb>
<forget.rb>4</forget.rb>
<sixtyfivelines.rb>8</sixtyfivelines.rb>
</results>
"
		}

		context1_3 = {
			:task_number=>"1",
			:word=>"tues",
			:format=>"json",
			:format_example=>
"\"file1.rb\":N,\"file2.rb\":N ..",
			:expected=>
"\"never.rb\":1,\"32lines.rb\":3,\"forget\":6,\"sixtyfivelines.rb\":6"
		}

		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
end
