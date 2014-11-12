require 'csv'

class CSVWriter

	def write (results)

		CSV.open("results_Krassen_Angelov_A_14.csv","w") do |csv|
			
			csv << ["First Name", "Last Name", "VH", "002", "003", "004", "009", "012"]
			
			results.keys.sort.each do |key|
				
				csv << [key.split(' ').first, key.split(' ').last, results[key]].flatten	
			
			end
		end

	end

end
