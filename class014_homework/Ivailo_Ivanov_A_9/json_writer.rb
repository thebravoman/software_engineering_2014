require 'json'

class JSONWriter
	def write(student)
		File.open("results_Ivailo_Ivanov_A_9.json", "w") do |file|
			file.write(JSON.pretty_generate(student))
		end
	end
end
