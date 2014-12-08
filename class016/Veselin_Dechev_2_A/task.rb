class Task
	
	@template = ""
	
	def initialize template
		@template = template
		@contexts = init_contexts
	end
	
	def generate numbers
		`mkdir tasks` if not Dir.exists?("tasks")
		`mkdir expects` if not Dir.exists?("expects")
		
		input = File.read(@template)
		eruby = Erubis::Eruby.new(input)
		context = @contexts.shuffle[0]
		context[:task_number] = random_string = SecureRandom.hex(4)
		numbers.shuffle!
		sample = numbers.pop
		File.open("tasks/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end	
		if (context[:format] == "csv")
			File.open("expects/#{context[:task_number]}.csv","w") do |file|
				file.write(context[:expected])
			end	
		elsif (context[:format] == "xml")
			File.open("expects/#{context[:task_number]}.xml","w") do |file|
				file.write(context[:expected])
			end
		elsif (context[:format] == "json")
			File.open("expects/#{context[:task_number]}.json","w") do |file|
				file.write(context[:expected])
			end
		end
	end
end
