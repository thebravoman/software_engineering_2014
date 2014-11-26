require 'json'

class JSONWriter
	def write(student)
		File.open("results.json", "w") do |file|
			file.write(JSON.pretty_generate(student))
		end
	end
end