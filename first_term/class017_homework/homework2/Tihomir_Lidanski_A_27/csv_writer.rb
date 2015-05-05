require 'csv'
class CSVWriter
	def write grades, time
		CSV.open("results_Tihomir_Lidanski_A_27.csv","w") do |csv|
			csv << ["#{time}", "", "VH", "002", "003", "004", "009", "012", "014", "171", "172", "g2", "g3", "g4", "g12", "g14", "g171", "g172", "y2", "y3", "y4", "y12", "y14", "y171", "y172"]
			grades.keys.sort.each do |key|
				csv << [key.split(' ').first, key.split(' ').last, grades[key]].flatten	
			end
		end		
	end
end
