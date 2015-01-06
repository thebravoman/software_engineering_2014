require "csv"
class CSVWriter
	def write results
		CSV.open("results_Stanislav_Valkanov_A_25.csv","w") do |csv|
	csv << ["Sudent/Homework", results.first.last.keys].flatten
	Hash[results.sort].keys.each do |key|
		csv << [key,results[key].values].flatten
	end
end
	end
end
