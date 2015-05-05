require 'csv'

class CSVWriter

	def write (results, end_time)
		CSV.open("results_Ivelin_Slavchev_A_10.csv","w") do |csv|
			csv << [end_time, "", "VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"]
			results.keys.sort.each do |key|
				csv << [key.split(' ').first, key.split(' ').last, results[key]].flatten	
			end
		end
	end

end
