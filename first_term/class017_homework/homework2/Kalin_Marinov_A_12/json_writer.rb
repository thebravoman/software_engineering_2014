require 'json'

class JSONWriter

	def write names, name_of_folder, folder_names

		names.each do |key, value|
			names[key] = { "results" => value.each_with_index { |value, index| names[key][index] = { folder_names[index+2] => value } } }
		end

		File.open(name_of_folder + ".json","w") do |json|
			json.write(JSON.pretty_generate names)
		end
	end

end

