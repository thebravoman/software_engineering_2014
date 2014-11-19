# csv writer
require 'csv'
class CSVWriter
	def write grades, time
		CSV.open("results_Petko_Bozhinov_A_21.csv","w") do |csv|
			csv << ["#{time}", "", "VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"]
			grades.keys.sort.each do |key|
				csv << [key.split(' ').first, key.split(' ').last, grades[key]].flatten	
			end
		end		
	end
end