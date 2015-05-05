require_relative 'task.rb'

class Task3 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:letters=>"5",
			:which_name=>"first",
			:which_to_sort=>"First Name",
			:in_what_order=>"ASC",
			:format=>"HTML",
			:example=>
				"<html>
					<body>
						FirstName1,LastName1 FirstName2,LastName2 FirstNameN,LastNameN
					</body>
				</html>
				",
			:expected=>
				"<html>
					<body>
						Atan,Georgiev Joro,Ivanov Bobo,Jordanov
					</body>
				</html>
				"

		}
		context1_2 = {
			:task_number=>"1",
			:letters=>"10",
			:which_name=>"second",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:format=>"HTML",
			:example=>
				"<html>
					<head></head>
					<body>
						FirstName1,LastName1 FirstName2,LastName2 FirstNameN,LastNameN
					</body>
				</html>",
			:expected=>
				"
				<html>
					<head></head>
					<body>
						omg,ASDFGEQWER wtf,BASDFEQWER
					</body>
				</html>
				"
		}
			[context1_1,context1_2]
	end
		def initialize
			super 'task3.eruby'
		end
end
