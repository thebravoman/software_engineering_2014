
require 'json'
class Task
	
	@template = ""
	
	def initialize template
		@template = template
		@contexts = init_contexts
	end
	
	def generate numbers

		system("mkdir tests") if not Dir.exists?("tasks")
		system("mkdir expects") if not Dir.exists?("expects")
		
		input = File.read(@template)
		eruby = Erubis::Eruby.new(input)
		context = @contexts.shuffle[0]
		context[:task_number] = random_string = SecureRandom.hex(3)
		numbers.shuffle!
		sample = numbers.pop


		File.open("tests/#{sample}_#{context[:task_number]}.txt","w") do |file|
			file.write(eruby.evaluate(context))
		end		
		if (context[:format] == "xml")
			File.open("expects/#{context[:task_number]}.xml","w") do |file|
				file.write(context[:expected])
			end
		elsif (context[:format] == "json")
			File.open("expects/#{context[:task_number]}.json","w") do |file|
				file.write(context[:expected]).to_json
			end
		end
	end
end
