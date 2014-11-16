require 'csv'

class CSVWriter

	def write results
		CSV.open("results.csv","w") do |csv|
			csv << ["Name",results.first[1].keys].flatten
			results.keys.each do |key|
				csv << [key,results[key].values].flatten	
			end
		end
	end

end
