require 'csv'
require 'yaml'

class CSVWriter
	def write result, end_time, thing
		CSV.open("results_Martin_Grigorov_B_23.csv","w") do |csv|
			csv << [end_time, "",thing["print_stuff"]["ini_config"].keys].flatten
			result.keys.each do |key|
				key_split = key.split(",")
				csv << [key_split,result[key]].flatten
			end
		end
	end
end
