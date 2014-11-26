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
		task_1=context.to_s.split("format=>\"").last.split("\"").first.to_s
		task_2=context.to_s.split("format=>\"").last.split("\"").first.to_s
		task_3=context.to_s.split("format=>\"").last.split("\"").first.to_s
		context[:task_number] = random_string = SecureRandom.hex(3)
		numbers.shuffle!
		sample = numbers.pop
			File.open("tests/#{sample}_#{context[:task_number]}.txt","w") do |file|
				file.write(eruby.evaluate(context))
			end
		
		if task_1 == "XML"
			File.open("expects/#{context[:task_number]}.xml","w") { |file| file.write(context[:expected]) }
		end
		if task_1 == "HTML"
			File.open("expects/#{context[:task_number]}.html","w") { |file| file.write(context[:expected]) }
		end
		if task_2 == "HTML"
			File.open("expects/#{context[:task_number]}.html","w") { |file| file.write(context[:expected]) }
		end
		if task_3 == "HTML"
			File.open("expects/#{context[:task_number]}.html","w") { |file| file.write(context[:expected]) }
		end
	end
end
