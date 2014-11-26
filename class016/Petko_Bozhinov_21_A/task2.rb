require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:what_to_find=>"the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different",
			:which_to_sort => "Last name",
			:sort_by => "f_length",
			:which_name => "first",
			:in_what_order => "ASC",
			:expected=>
"<class>
		<student>
			<name>Goshhiioo gioshev</name>
			<name>Gosho Goshev</name>
			<name>Pesho Peshev</name>
			<name>Pesho Peshevski</name>
			<name>Tishp Penev</name>
			<f_length>Length of the <%= @which_name %> name</f_length>
			<loc>Path_to_folder</loc>
		</student>
	</class>
"
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end