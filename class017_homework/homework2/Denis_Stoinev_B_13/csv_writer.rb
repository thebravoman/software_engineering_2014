require 'csv'

class CSVWriter
	def write(results, flog, flay)
		CSV.open("results_Denis_Stoinev_B_13.csv", "w") do |csv|
			csv << ["", "", "VH", "002", "003", "004", "009", "012", "014", "015", "017", 
			"g2", "g3", "g4", "g12", "g14", "g15", "g17", "y2", "y3", "y4", "y12", "y14", "y15", "y17"]
			results.keys.sort.each do |key|
				csv << [key.split("_").first, key.split("_")[1], results[key].values, flog[key].values, 
					   flay[key].values].flatten
			end
		end
	end
end
