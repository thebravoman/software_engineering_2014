require 'csv'

class CSVWriter
	def write(results, classes)
		CSV.open("results_Hristiyan_Velyakov_A_28.csv", "w") do |csv|
			csv << ["", "", classes].flatten
			results.keys.sort.each do |key|
				student = key.split("_")
				csv << [student, results[key].values].flatten
			end
		end
	end
end
