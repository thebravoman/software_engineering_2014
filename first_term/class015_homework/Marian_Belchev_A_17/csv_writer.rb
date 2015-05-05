require 'csv'

class CSVWriter
	def write results, time
		CSV.open("results_Marian_Belchev_A_17.csv", "w") do |csv|
			csv << ["Measure time: #{time}"]
			csv << ["First & Last name",
					"VH","002","003","004","009","012", "014", 
					"g2", "g3", "g4", "g9", "g12", "g14", 
					"y2", "y3", "y4", "y9", "y12", "y14"]
			results.keys.sort.each do |key|
				csv << [key, results[key].values].flatten
			end
		end
	end
end
