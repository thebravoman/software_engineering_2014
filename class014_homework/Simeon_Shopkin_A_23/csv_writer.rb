require "csv"
class CSVWriter
	def write results
		CSV.open("results_Simeon_Shopkin_A_23.csv","w") do |csv|
	csv << ["Sudent/Homework", results.first.last.keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten
	end
end
	end
end
