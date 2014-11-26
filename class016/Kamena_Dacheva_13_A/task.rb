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
		file1 = context.to_s.split("new_file_format1=>\"").last.split("\"").first.to_s
		file2 = context.to_s.split("new_file_format2=>\"").last.split("\"").first.to_s
		file3 = context.to_s.split("write_in=>\"").last.split("\"").first.to_s
		context[:task_number] = random_string = SecureRandom.hex(3)
		numbers.shuffle!
		sample = numbers.pop

		File.open("tests/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end

		if file1 == "CSV" || file3 == "CSV"
			puts "csv"	
			File.open("expects/#{context[:task_number]}.csv","w") { |file| file.write(context[:expected]) }
		end
		if file2 == "CSV"
			puts "csv"	
			File.open("expects/#{context[:task_number]}.csv","w") { |file| file.write(context[:expected1]) }
		end	
		if file1 == "XML" || file3 == "XML"
			File.open("expects/#{context[:task_number]}.xml","w") { |file| file.write(context[:expected]) }
		end
		if file2 == "XML"
			File.open("expects/#{context[:task_number]}.xml","w") { |file| file.write(context[:expected1]) }
		end
		if file1 == "HTML" || file3 == "HTML"
			File.open("expects/#{context[:task_number]}.html","w") { |file| file.write(context[:expected]) }
		end
		if file2 == "HTML"
			File.open("expects/#{context[:task_number]}.html","w") { |file| file.write(context[:expected1]) }
		end
		if file1 == "JSON" || file3 == "JSON" 
			File.open("expects/#{context[:task_number]}.json","w") { |file|	file.write(context[:expected]) }
		end
		if file2 == "JSON"
			File.open("expects/#{context[:task_number]}.json","w") { |file|	file.write(context[:expected1]) }
		end
	end
end
