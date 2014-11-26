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
		context[:task_number] = random_string = SecureRandom.hex(3)
		numbers.shuffle!
		sample = numbers.pop
		File.open("tests/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end	
		File.open("expects/#{context[:task_number]}.csv","w") do |file|
			file.write(context[:expected])
		end	
	end
end
