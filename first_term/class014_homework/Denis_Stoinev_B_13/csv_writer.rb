require 'csv'

class CSVWriter
	def write(results)
		CSV.open("results_Denis_Stoinev_B_13.csv", "w") do |csv|
			csv << ["", "", "VH", "002", "003", "004", "009", "012"]
			results.keys.sort.each do |key|
				csv << [key.split("_").first, key.split("_")[1], results[key]["VH"],
				results[key]["002"], results[key]["003"], results[key]["004"], results[key]["009"], 
				results[key]["012"]].flatten 
			end
		end
	end
end
