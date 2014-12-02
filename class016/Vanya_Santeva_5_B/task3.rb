require_relative 'task.rb'

class Task3 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:length=>"5",
			:in_what_order => "ASC",
			:format=>"csv",
			:format_example=>
"file1.rb,9
file2.rb,11
",
			:expected=>
"never.rb,11
forget.rb,16
32lines.rb,32
sixtyfivelines.rb,96
"
		}

		context1_2 = {
			:task_number=>"2",
			:length=>"10",
			:in_what_order => "ASC",
			:format=>"xml",
			:format_example=>
"<results>
<file1.rb>8</file1.rb>
<file2.rb>11</file2.rb>
</results>
",
			:expected=>
"<results>
<never.rb>3</never.rb>
<forget.rb>5</forget.rb>
<32lines.rb>15</32lines.rb>
<sixtyfivelines.rb>30</sixtyfivelines.rb>
</results>
"
		}

		context1_3 = {
			:task_number=>"3",
			:length=>"6",
			:in_what_order => "ASC",
			:format=>"json",
			:format_example=>
"\"file1.rb\":9,\"file2.rb\":11",
			:expected=>
"\"never.rb\":6,\"forget.rb\":9,\"32lines.rb\":27,\"sixtyfivelines\":54"
}

		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task3.eruby'
	end
end
