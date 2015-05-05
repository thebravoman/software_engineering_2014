require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"2",
			:what_to_find=>"all the programs that have flog under 200",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "xml",
			:expected=>
"
<allStudents><student><secondName>Stoinev</secondName></student><student><secondName>Matev</secondName></student><student><secondName>Velyakov</secondName></student><student><secondName>Dachev</secondName></student><student><secondName>Germanov</secondName></student><student><secondName>Ivanov</secondName></student><student><secondName>Marinov</secondName></student><student><secondName>Belchev</secondName></student><student><secondName>Mihailov</secondName></student><student><secondName>Iliev</secondName></student><student><secondName>Kolev</secondName></student><student><secondName>Dechev</secondName></student></allStudents>
"
		}
	
		context1_2 = {
			:task_number=>"2",
			:what_to_find=>"all the programs that have flay between 1 and 10",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "xml",
			:expected=>
"
<allStudents><student><secondName>Ivancheva</secondName></student><student><secondName>Rusinov</secondName></student><student><secondName>Georgiev</secondName></student><student><secondName>Terziev</secondName></student><student><secondName>Karakoleva</secondName></student><student><secondName>Velev</secondName></student><student><secondName>Nikolov</secondName></student><student><secondName>Velyakov</secondName></student><student><secondName>Slavchev</secondName></student><student><secondName>Valchev</secondName></student><student><secondName>Nikov</secondName></student><student><secondName>Dacheva</secondName></student><student><secondName>Kostov</secondName></student><student><secondName>Angelov</secondName></student><student><secondName>Pironkova</secondName></student><student><secondName>Kokalova</secondName></student><student><secondName>Yankov</secondName></student><student><secondName>Karadimov</secondName></student><student><secondName>Marinov</secondName></student><student><secondName>Bozhinov</secondName></student><student><secondName>Kostadinov</secondName></student><student><secondName>Shopkin</secondName></student><student><secondName>Bogdanov</secondName></student><student><secondName>Valkanov</secondName></student><student><secondName>Iliev</secondName></student><student><secondName>Lidanski</secondName></student><student><secondName>Georgiev</secondName></student><student><secondName>Santeva</secondName></student><student><secondName>Kostov</secondName></student><student><secondName>Dechev</secondName></student><student><secondName>Kolova</secondName></student></allStudents>
"
		}
		
		context1_3 = {
			:task_number=>"2",
			:what_to_find=>"all the programs that have flog between 200 and 350",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "xml",
			:expected=>
"
<allStudents><student><secondName>Ivancheva</secondName></student><student><secondName>Terziev</secondName></student><student><secondName>Karakoleva</secondName></student><student><secondName>Sokolov</secondName></student><student><secondName>Velev</secondName></student><student><secondName>Velyakov</secondName></student><student><secondName>Saleh</secondName></student><student><secondName>Slavchev</secondName></student><student><secondName>Valchev</secondName></student><student><secondName>Nikov</secondName></student><student><secondName>Dacheva</secondName></student><student><secondName>Kostov</secondName></student><student><secondName>Angelov</secondName></student><student><secondName>Kokalova</secondName></student><student><secondName>Yankov</secondName></student><student><secondName>Grigorov</secondName></student><student><secondName>Marinov</secondName></student><student><secondName>Bozhinov</secondName></student><student><secondName>Shopkin</secondName></student><student><secondName>Bogdanov</secondName></student><student><secondName>Valkanov</secondName></student><student><secondName>Radev</secondName></student><student><secondName>Lidanski</secondName></student><student><secondName>Georgiev</secondName></student><student><secondName>Santeva</secondName></student><student><secondName>Kostov</secondName></student><student><secondName>Dechev</secondName></student><student><secondName>Kolova</secondName></student></allStudents>
"
		}
		[context1_1, context1_2, context1_3]
	end
	
	def initialize
		taskNumber = 2
		super 'task2.eruby', taskNumber
	end
	
end
