require 'json'

class JSONWriter

	def write names, name_of_folder
		File.open(name_of_folder + ".json","w") do |json|
			json.write([" ", " ", "VH", "002", "003", "004", "009", "012"])
			json.puts ""
			names.each do |key, value|
				json.write(key.to_json)
				json.write(value.to_json)
				json.puts ""
			end
		end
	end

end

