class Task
	
	@template = ""
	
	def initialize template, taskNumber
		@taskNumber = taskNumber
		@template = template
		@contexts = init_contexts
	end
	
	def generate numbers
		input = File.read(@template)
		eruby = Erubis::Eruby.new(input)
		context = @contexts.shuffle[0]
		context[:task_number] = random_string = SecureRandom.hex(3)
		numbers.shuffle!
		sample = numbers.pop

		File.open("tasks/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end

		case @taskNumber
			when 1
				format = "csv"
			when 2
				format = "xml"
			else
				format = ""
		end

		File.open("expects/#{context[:task_number]}.#{format}","w") do |file|
			file.write(context[:expected])
		end	
	end
end