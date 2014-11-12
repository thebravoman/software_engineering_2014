require 'csv'

class CSVWriter

	def write names, name_of_folder
		CSV.open(name_of_folder + ".csv", "w") do |csv|
			csv << [" ", " ", "VH", "002", "003", "004", "009", "012"]
			names.each do |key, value| 	
				csv << key.split(" ") + value
			end
		end
	end

end
