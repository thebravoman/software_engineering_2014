require 'csv'

class CSVwritter
	def write results
		CSV.open("results.csv","w") do |csv|
			csv << ["Program name", results.first.last.keys].flatten
			results.keys.each do |key|
				csv << [key,results[key].values].flatten
			end
		end
end
end
