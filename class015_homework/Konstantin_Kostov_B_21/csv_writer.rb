require "csv"

class CSVWriter
	def write(result,classes)
		CSV.open("results_Konstantin_Kostov_B_21.csv","w") do |csv|
			csv << classes
			result.keys.sort.each do |key|
				key_split = key.split(",")
				csv << [key_split,result[key]].flatten
			end
		end
	end

end
