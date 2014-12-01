require "csv"

class CSVWriter
	def write(result,classes,folder)
		CSV.open("results_Nikolay_Mihailov_B_25.csv","w") do |csv|
			csv << classes
			result.keys.sort.each do |key|
				key_split = key.split(",")
				csv << [key_split,result[key]].flatten
			end
		end
	end

end
