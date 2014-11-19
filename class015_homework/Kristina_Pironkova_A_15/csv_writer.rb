require 'csv'

class CSVWriter
	def write results,time
			mainRow = ["#{time}",
					   "","VH","002","003","004","009","012","014","g2","g3","g4","g9","g12","g14","y2","y3","y4","y9","y12","y14"]
			CSV.open("results_Kristina_Pironkova_A_15.csv", "w") do |csv|
				csv << mainRow
				results.keys.sort.each do |key|

				# csv << [key.split(" ").first,key.split(" ").last, results[key]["VH"],
				# 	results[key]["002"], results[key]["003"], results[key]["004"], results[key]["009"], 
				# 	results[key]["012"],results[key]["014"],results[key]["g2"],results[key]["y2"]].flatten 
				csv << [key.split(" ").first,key.split(" ").last,results[key].values].flatten
				end
			end
end
end


