require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
<<<<<<< HEAD
			:task_number=>"1",
			:letters=>"5",
			:which_name=>"second",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:expected=>
"F5le8,L5le1
F5le2,L5le2
F5le3,L5le3
=======
			:number=>"0",
			:in_what_order=>"ASC",
			:expected=>
"<html>
<body>
	<p>Aletko</p>
	<p>Anastas</p>
	<p>Bastion</p>
	<p>Ceco</p>
	<p>Prestoslav</p>
</body>
</html>
>>>>>>> ecad50a1c3744c91d32acab19321d58d8ca51297
"
		}
		
		context1_2 = {
<<<<<<< HEAD
			:task_number=>"1",
			:letters=>"10",
			:which_name=>"second",
			:which_to_sort=>"Last Name",
			:in_what_order=>"ASC",
			:expected=>
"F10letter0,L10letter1
F10letter2,L10letter2
F10letter3,L10letter4
F10letters,L10letters
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:letters=>"5",
			:which_name=>"second",
			:which_to_sort=>"First name",
			:in_what_order=>"DESC",
			:expected=>
"F5le8,L5le1
F5le3,L5le3
F5le2,L5le2
"
		}
		
		context1_4 = {
			:task_number=>"1",
			:letters=>"10",
			:which_name=>"first",
			:which_to_sort=>"Last Name",
			:in_what_order=>"DESC",
			:expected=>
"FirstName2,LastName2
FirstName1,LastName1
F10letters,L10letters
F10letter3,L10letter4
F10letter2,L10letter2
F10letter0,L10letter1
"
		}
		
		[context1_1,context1_2,context1_3,context1_4]
=======
			:number=>"1",
			:in_what_order=>"DESC",
			:expected=>
"<html>
<body>
	<p>Name</p>
	<p>Peshko</p>
	<p>SomeoneElse</p>
</body>
</html>
"
		}
		
		[context1_1,context1_2]
>>>>>>> ecad50a1c3744c91d32acab19321d58d8ca51297
	end
	
	def initialize
		super 'task1.eruby'
	end
end
