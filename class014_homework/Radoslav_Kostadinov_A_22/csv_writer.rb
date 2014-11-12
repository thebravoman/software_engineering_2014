require 'csv'

class CSVwritter
	def write results
	mainRow = ["FirstName","LastName","VH","002","003","004","012"]
			CSV.open("results_Radoslav_Kostadinov_A_22.csv", "w") do |csv|
				csv << mainRow
				results.keys.each do |key|
				csv << [key.split(" ").first,key.split(" ").last, results[key]["VH"],
					results[key]["002"], results[key]["003"], results[key]["004"], results[key]["009"], 
					results[key]["012"]].flatten 
								end
			end
end
end
