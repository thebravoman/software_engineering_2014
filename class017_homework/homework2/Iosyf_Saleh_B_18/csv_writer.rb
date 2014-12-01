require 'csv'


class CSVWriter
	def write result,cff
		CSV.open("results_Iosyf_Saleh_B_18.csv","w") do |csv|
			csv << cff
			result.keys.each do |key|
				key_split = key.split(",")
				csv << [key_split,result[key]].flatten
			end
		end
	end
end
