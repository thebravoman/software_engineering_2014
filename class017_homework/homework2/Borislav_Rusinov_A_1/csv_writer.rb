require 'csv'

class CSVWriter
	def write(results,time)
			mainRow = ["#{time}",' ',"VH","002","003","004","009","012","014","0171","0172","g2","g3","g4","g9","g12","g14","g171","g172","y2","y3","y4","y9","y12","y14","y171","y172"]
			CSV.open("results_Borislav_Rusinov_A_1.csv", "w") do |csv|
				csv << mainRow
				results.keys.sort.each do |key|
				csv << [key.split(" ").first,key.split(" ").last,results[key].values].flatten
				end
			end
end
end


