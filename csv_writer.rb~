require 'csv'
class CSVWriter
	def write results
		CSV.open("results_Kamena_Dacheva_A_13.csv","w") do |csv|
			csv << [" ","VH","002","003","004","009","012"]
				results.keys.sort.uniq.each do |key|
					csv << [key, results[key]].flatten
				end
		end
	end
end

