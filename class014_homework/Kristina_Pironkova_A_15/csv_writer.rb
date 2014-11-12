require 'csv'

class CSVWriter
	def write results
		CSV.open("results_Kristina_Pironkova_A_15.csv","w") do |csv|
			csv << ["","", "VH", "002", "003", "004","012"].flatten
				results.keys.sort.each do |key|
				csv << [key, results[key]].flatten
				end
			
		end
	end
end

