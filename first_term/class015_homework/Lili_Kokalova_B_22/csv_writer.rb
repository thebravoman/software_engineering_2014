require 'csv'

class CSVwriter
	def write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, flog002, flog003, flog004, flog012, flog014)
		CSV.open("results_Lili_Kokalova_B_22.csv", "w") do |csv|
			csv << ["#{time_program}", " ", "VH", "002", "003", "004", "009", "012","014", "g2", "g3", "g4", "g12","g14", "y2", "y3", "y4", "y12", "y14"]
			n = 0
			all_students.each do |first, last|
				csv << ["#{first}","#{last}","#{resultsVH[n]}", "#{results002[n]}", "#{results003[n]}","#{results004[n]}","#{results009[n]}","#{results012[n]}", "#{results014[n]}", "#{flog002[n]}", "#{flog003[n]}", "#{flog004[n]}", "#{flog012[n]}", "#{flog014[n]}"]
				n = n + 1
			end
		end
	end
end
