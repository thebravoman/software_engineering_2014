require 'csv'

class CSVWriter
	def write results
		CSV.open("results_Marian_Belchev_A_17.csv", "w") do |csv|
			csv << ["FirstName LastName","VH","002","003","004","009","012"]
			results.keys.sort.each do |key|
				csv << [key, results[key].values].flatten
			end
		end
	end
end
