require_relative 'task.rb'

class Task2 < Task

	def return_ext
		return context1_1[:extension]
	end

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:which_to_sort => "Last name",
			:sort_by => "f_length",
			:which_name => "first",
			:in_what_order => "ASC",
			:extension => "xml",
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
		
		[context1_1]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end