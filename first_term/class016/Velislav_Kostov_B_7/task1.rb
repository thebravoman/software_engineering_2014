require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:comparison=>"equal",
			:sign=>"=",
			:value=>"5"
			:format=>"html",
			:expected=>
"<html>
    <head>result</head>
        <body>
            <p>X operation Y = 5</p>
            <p>X2 operation2 Y2 = 5</p>
        </body>
</html>"
		}
		
		context1_2 = {
			:task_number=>"1",
			:comparison=>"unequal",
			:sign=>"!=",
			:value=>"24"
			:format=>"xml",
			:expected=>
"<result>
    <pair>X operation Y != 24</pair>
    <pair>X2 operation2 Y2 != 24</pair>
</result>"
		}
		
		[context1_1,context1_2]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
