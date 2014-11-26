require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number => ARGV[0],
			:letters => "5",
			:which_name => "Last",
			:which_to_sort => "First Name",
			:in_what_order => "DESC",
			:extension => "html",
			:expected=>
"<!DOCTYPE html>
<html>
<body>
<h4>F8le1,L1le3,13</h4>
<h4>F5le8,L5le1,13</h4>
<h4>F5le3,L5le3,13</h4>
<h4>F5le2,L5le2,13</h4>
<h4>F2le4,Last1,13</h4>
<h4>F2le2,L9le4,13</h4>
</body>
</html>
"
		}
		
		context1_2 = {
			:task_number => ARGV[0],
			:letters => "10",
			:which_name => "First",
			:which_to_sort => "Length",
			:in_what_order => "ASC",
			:extension => "html",
			:expected=>
"<!DOCTYPE html>
<html>
<body>
<h4>F10letter0,L10letter1,23</h4>
<h4>F10letter2,L10letter2,23</h4>
<h4>F10letter3,L10letter4,23</h4>
<h4>F10letters,L10letters,23</h4>
<h4>FirstName1,LastName1,25</h4>
<h4>FirstName2,LastName2,25</h4>
</body>
</html>
"
			
		}
		
		context1_3 = {
			:task_number => ARGV[0],
			:letters => "5",
			:which_name => "First",
			:which_to_sort => "Last Name",
			:in_what_order => "ASC",
			:extension => "html",
			:expected=>
"<!DOCTYPE html>
<html>
<body>
<h4>F8le1,L1le3,13</h4>
<h4>F5le8,L5le1,13</h4>
<h4>F5le2,L5le2,13</h4>
<h4>F5le3,L5le3,13</h4>
<h4>F2le2,L9le4,13</h4>
<h4>F2le4,Last1,13</h4>
</body>
</html>
"
			
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end
