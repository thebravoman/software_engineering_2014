require_relative 'task.rb'

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"3",
			:what_to_find=>"Find the sum of the two digits of the student number that is greater than 7",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:expected=>
"
{
  \"Ivailo\": \"Ivanov\",
  \"Stanislav\": \"Iliev\",
  \"Stefan\": \"Iliev\",
  \"Kaloyan\": \"Nikov\",
  \"Hristiyan\": \"Velyakov\",
  \"Veselina\": \"Kolova\",
  \"Elena\": \"Karakoleva\",
  \"Iliyan\": \"Germanov\",
  \"Marian\": \"Belchev\",
  \"Moretti\": \"Georgiev\",
  \"Hristo\": \"Dachev\",
  \"Tihomir\": \"Lidanski\",
  \"Iosyf\": \"Saleh\"
}
"
		}
		
		context1_2 = {
			:task_number=>"3",
			:what_to_find=>"Find the difference of the two digits of the student number that is lower than 0",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:expected=>
"
{
  \"Nikolay\": \"Mihailov\",
  \"Ivo\": \"Stratev\",
  \"Mladen\": \"Karadimov\",
  \"Martin\": \"Grigorov\",
  \"Stanislav\": \"Valkanov\",
  \"Stefan\": \"Iliev\",
  \"Kaloyan\": \"Nikov\",
  \"Hristiyan\": \"Velyakov\",
  \"David\": \"Georgiev\",
  \"Kamena\": \"Dacheva\",
  \"Krassen\": \"Angelov\",
  \"Simeon\": \"Shopkin\",
  \"Kalin\": \"Marinov\",
  \"Iliyan\": \"Germanov\",
  \"Emiliqn\": \"Sokolov\",
  \"Stanimir\": \"Bogdanov\",
  \"Marian\": \"Belchev\",
  \"Moretti\": \"Georgiev\",
  \"Denis\": \"Stoinev\",
  \"Lubomir\": \"Yankov\",
  \"Hristo\": \"Dachev\",
  \"Kristina\": \"Pironkova\",
 \"Tihomir\": \"Lidanski\",
 \"Iosyf\": \"Saleh\"
}
"
		}
				
		
		[context1_1,context1_2]
	end
	
	def initialize
		taskNumber = 3
		super 'task3.eruby', taskNumber
	end

end
