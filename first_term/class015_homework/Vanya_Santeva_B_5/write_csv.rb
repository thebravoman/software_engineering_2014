require 'csv'

def write_to_CSV(results, time)
	CSV.open("results_Vanya_Santeva_B_5.csv","w") do |csv|
		csv << ["#{time}", " ", "VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"].flatten
		results.each do |student, result|
			csv << [student.split(' ')[0], student.split(' ')[1], result].flatten
		end
	end
end
