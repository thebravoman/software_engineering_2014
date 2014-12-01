require 'json'

class JSONWriter
	def write(student)
		File.open("results_Moretti_Georgiev_A_19.json", "w") do |file|
			file.write(JSON.pretty_generate(student))
		end
	end
end