require 'csv'

class CSVwriter
	def write(all_students, resultsVH, results002, results003, results004, results009, results012)
		CSV.open("results_Stefan_Radev_B_27.csv", "w") do |csv|
			csv << [" ", " ", "VH", "002", "003", "004", "009", "012"]
			n = 0
			all_students.each do |first, last|
				csv << ["#{first}", "#{last}", "#{resultsVH[n]}",  "#{results002[n]}", "#{results003[n]}", "#{results004[n]}","#{results009[n]}", "#{results012[n]}"]
				n = n + 1
			end
		end
	end
end
