require_relative 'task.rb'

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number=>"1",
			:more_or_less => "more",
			:letters=>"3",
			:which_name=>"first",
			:which_to_sort=>"First name",
			:in_what_order=>"ASC",
			:is_odd => "odd",
			:format => "csv",
			:expected=>
"
Atanaska,Ivancheva
Borislav,Rusinov
Denis,Stoinev
Dimitar,Matev
Emiliqn,Sokolov
Gergan,Nikolov
Hristiyan,Dodov
Hristo,Dachev
Iliyan,Germanov
Ivailo,Ivanov
Kaloyan,Nikov
Kamena,Dacheva
Konstantin,Kostov
Kristina,Pironkova
Marian,Belchev
Martin,Grigorov
Moretti,Georgiev
Nikolay,Mihailov
Petko,Bozhinov
Simeon,Shopkin
Stanislav,Valkanov
Stefan,Radev
Tihomir,Lidanski
Valentin,Georgiev
Vanya,Santeva
Velislav,Kostov

"
		}
		
		context1_2 = {
			:task_number=>"1",
			:more_or_less => "less",
			:letters=>"8",
			:which_name=>"second",
			:which_to_sort=>"First name",
			:in_what_order=>"ASC",
			:is_odd => "odd",
			:format => "csv",
			:expected=>
"Borislav,Rusinov
Denis,Stoinev
Dimitar,Matev
Emiliqn,Sokolov
Gergan,Nikolov
Hristiyan,Dodov
Hristo,Dachev
Ivailo,Ivanov
Ivo,Valchev
Kaloyan,Nikov
Kamena,Dacheva
Konstantin,Kostov
Marian,Belchev
Simeon,Shopkin
Stefan,Radev
Vanya,Santeva
Velislav,Kostov
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:more_or_less => "more",
			:letters=>"6",
			:which_name=>"second",
			:which_to_sort=>"First name",
			:in_what_order=>"ASC",
			:is_odd => "even",
			:format => "csv",
			:expected=>
"
Borislav,Stratev
David,Georgiev
Dimitar,Terziev
Elena,Karakoleva
Hristiyan,Velyakov
Ivelin,Slavchev
Ivo,Stratev
Kalin,Marinov
Konstantin,Vekilski
Krassen,Angelov
Lili,Kokalova
Mladen,Karadimov
Moretti,Georgiev
Nikola,Marinov
Radoslav,Kostadinov
Stanimir,Bogdanov
Valentin,Varbanov

"
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		taskNumber = 1
		super 'task1.eruby', taskNumber
	end
end
