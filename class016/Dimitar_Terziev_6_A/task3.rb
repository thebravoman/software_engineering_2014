require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:which_to_sort => "first name",
			:in_what_order => "ASC",
			:expected=><<-EOS
{
  "students_with_zero": [
   	"student":[
   		"Dimitar_Andreev",
		"Dimitar_Matev",
		"Dimitar_Nestorov",
		"Georgi_Ivanov",
		"Kaloyan_Nikov",
		"Konstantin_Kostov",
		"Marian_Belchev",
		"Simeon_Shopkin",
		"Stanislav_Gospodinov",
		"atanaska_ivancheva",
		"mladen_karadimov"
   	]
  ]
}
EOS
		}

		context1_2 = {
			:task_number=>"1",
			:which_to_sort => "last name",
			:in_what_order => "ASC",
			:expected=><<-EOS
{
  "students_with_zero": [
  	"student":[
		"Dimitar_Andreev",
		"Marian_Belchev",
		"Stanislav_Gospodinov",
		"Georgi_Ivanov",
		"Konstantin_Kostov",
		"Dimitar_Matev",
		"Dimitar_Nestorov",
		"Kaloyan_Nikov",
		"Simeon_Shopkin",
		"atanaska_ivancheva",
		"mladen_karadimov"
    ]
  ]
}
EOS
		}

		context1_3 = {
			:task_number=>"1",
			:which_to_sort => "last name",
			:in_what_order => "DESC",
			:expected=><<-EOS
{
  "students_with_zero": [
  	"student":[
		"mladen_karadimov",
		"atanaska_ivancheva",
		"Simeon_Shopkin",
		"Kaloyan_Nikov",
		"Dimitar_Nestorov",
		"Dimitar_Matev",
		"Konstantin_Kostov",
		"Georgi_Ivanov",
		"Stanislav_Gospodinov",
		"Marian_Belchev",
		"Dimitar_Andreev"
    ]
  ]
}
EOS
		}

		context1_4 = {
			:task_number=>"1",
			:which_to_sort => "first name",
			:in_what_order => "DESC",
			:expected=><<-EOS
{
  "students_with_zero": [
  	"student":[
	    "mladen_karadimov",
		"atanaska_ivancheva",
		"Stanislav_Gospodinov",
		"Simeon_Shopkin",
		"Marian_Belchev",
		"Konstantin_Kostov",
		"Kaloyan_Nikov",
		"Georgi_Ivanov",
		"Dimitar_Andreev",
		"Dimitar_Matev",
		"Dimitar_Nestorov"
    ]
  ]
}
EOS
		}

	
		
		[context1_1,context1_2,context1_3,context1_4]
	end
	
	def initialize
		super 'task3.eruby'
	end

end
