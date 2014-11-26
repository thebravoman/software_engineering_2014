require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:folder=>"class014_homework",
			:flog_number=>"UNDER 200",
			:sort=>"FIRSTNAME",
			:expected=>
"Denis,Stoinev,181
Dimitar,Matev,180
Hristiyan,Dodov,166
Hristiyan,Velyakov,69
Hristo,Dachev,135
Iliyan,Germanov,181
Ivailo,Ivanov,104
Kalin,Marinov,180
Marian,Belchev,138
Moretti,Georgiev,104
Nikolay,Mihailov,159
Stefan,Iliev,127
Vasil,Kolev,139
Veselin,Dechev,69"
		}

		context1_2 = {
			:task_number=>"1",
			:folder=>"class014_homework",
			:flog_number=>"OVER 600",
			:sort=>"FLOG RESULT",
			:expected=>
"Konstantin,Vekilski,879
David,Georgiev,908"
		}

		context1_3 = {
			:task_number=>"1",
			:folder=>"class015_homework",
			:flog_number=>"UNDER 200",
			:sort=>"FIRSTNAME",
			:expected=>
"Denis,Stoinev,141
Dimitar,Andreev,181
Dimitar,Matev,188
Dimitar,Terziev,87
George,Vevel,191
Hristiyan,Dodov,184
Hristo,Dachev,124
Iliyan,Germanov,141
Ivailo,Ivanov,140
Ivo,Valchev,87
Kalin,Marinov,188
Konstantin,Kostov,191
Marian,Belchev,126
Moretti,Georgiev,140
Nikolay,Mihailov,192
Stanimir,Bogdanov,87
Valentin,Varbanov,49
Vasil,Kolev,181
Velislav,Kostov,3"
		}

		context1_4 = {
			:task_number=>"1",
			:folder=>"class015_homework",
			:flog_number=>"OVER 600",
			:sort=>"FLOG RESULT",
			:expected=>
"Konstantin,Vekilski,727
David,Georgiev,735"
		}

		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task1.eruby', 1
	end
end