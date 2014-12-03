require 'csv'

class CSVWriter

	def write names, name_of_folder, folder_names
		CSV.open(name_of_folder + ".csv", "w") do |csv|
			csv << folder_names
			names.each do |key, value| 	
				csv << key.split(" ") + value
			end
		end
	end

end
