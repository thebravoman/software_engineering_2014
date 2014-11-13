require 'csv'

class CSVWriter
	def write results
		CSV.open("results_Hristo_Dachev_A_29.csv", "w") do |csv|
			csv << ["FirstName LastName","VH","002","003","004","009","012"]
			results.keys.sort.each do |key|
				csv << [key, results[key].values].flatten
			end
		end
	end
end
