require 'erubis'
require 'securerandom'

class Task
	
	@template = ""
	
	def initialize template
		@template = template
		@contexts = init_contexts
	end
	
	def generate numbers
		input = File.read(@template)
		eruby = Erubis::Eruby.new(input)
		context = @contexts.shuffle[0]
		context[:task_number] = random_string = SecureRandom.hex(4)
		numbers.shuffle!
		sample = numbers.pop
		File.open("tasks/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end	
		File.open("expects/#{context[:task_number]}.#{context[:extension]}","w") do |file|
			file.write(context[:expected])
		end	
	end
	
end

class Task1 < Task

	def init_contexts
	
		context1_1 = {
			:task_number => ARGV[0],
			:extension => "htul",
			:expected => ""
		}
		
		context1_2 = {
			:task_number => ARGV[0],
			:extension => "zxcc",
			:expected => ""
			
		}
		
		context1_3 = {
			:task_number => ARGV[0],
			:extension => "html2",
			:expected => ""
			
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task1.eruby'
	end
end

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number => ARGV[1],
			:extension => "ccv",
			:expected => ""
		
			}
		
		context1_2 = {
			:task_number => ARGV[1],
			:extension => "csf",
			:expected => ""
		
		}
		
		context1_3 = {
			:task_number => ARGV[1],
			:extension => "csx",
			:expected => ""
		
		}
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end

class Task3 < Task

	def init_contexts

		context1_1 = {
			:task_number => ARGV[2],
			:extension => "jsan",
			:expected => ""
		}
		
		context1_2 = {
			:task_number => ARGV[2],
			:extension => "jsome",
			:expected => ""
		}
		
		context1_3 = {
			:task_number => ARGV[2],
			:extension => "jsun",
			:expected => ""
		}
		
		
		[context1_1,context1_2,context1_3]
	end
	
	def initialize
		super 'task3.eruby'
	end

end


numbers = ARGV.to_a

tasks = [Task1.new, Task2.new, Task3.new]
while numbers.size>0
	tasks.shuffle[0].generate(numbers)
end
