require 'csv'

class CSVWriter
	def write(results, classes, time)
		CSV.open("results_Denis_Stoinev_B_13.csv", "w") do |csv|
			csv << ["", time, classes].flatten
			results.keys.sort.each do |key|
				student = key.split("_")
				csv << [student, results[key].values].flatten
			end
		end
	end
end
