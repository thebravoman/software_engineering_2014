require 'csv'

class CSVWriter

	def write(results, run_time)
		CSV.open("results_Ivelin_Slavchev_A_10.csv", "w") do |csv|			
			results.each_key do |key|
				csv << [run_time,results[key].keys].flatten
				break
			end		
			results.each_key do |key|
				csv << [key,results[key].values].flatten
			end
		end
	end
	
end
