require 'csv'
class CSVWriter
	def write(results, run_time)
		CSV.open("results_Lubomir_Yankov_16_A.csv", "w") do |csv|
			
			results.each_key do |key|
				csv << [run_time,results[key].keys].flatten
				break
			end
			
			results.keys.sort.each do |key|
				csv << [key,results[key].values].flatten
			end
		end
	end
end

