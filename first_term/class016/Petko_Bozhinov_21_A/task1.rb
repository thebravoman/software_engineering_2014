require_relative 'task.rb'

class Task1 < Task

	def return_ext
		return context1_1[:extension]
	end

	def init_contexts
	
		context1_1 = {
			:task_number => "1",
			:letters => "5",
			:which_name => "first",
			:in_what_order => "ASC",
			:extension => "xml",
			:example =>
"<class>
			<length>
				<size>5</size>
				<name>First Name</name>
				<name>FiveD igits</name>
				<name>Exampl Ename</name>
			</length>
			<length>
				<size>6</size>
				<name>FirstN Ame</name>
				<name>SixDig Its</name>
				<name>ExamplE Name</name>
			</length>
			...
		</class>
",
			:expected => 
"<class>
			<length>
				<size>5</size>
				<name>Gosho Gochev</name>
				<name>Pesho Peshev</name>
				<name>Pesho Peshov</name>
				<name>Peshp Peshev</name>
			</length>
		</class>
"
		}

		[context1_1]
	end
	
	def initialize
		super 'task1.eruby'
	end
end