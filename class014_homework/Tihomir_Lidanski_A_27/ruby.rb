require 'csv'

class CSVWriter
	def write results
		CSV.open("results_Tihomir_Lidanski_A_27.csv", "w") do |csv|
			csv << ["", "", "VH", "002", "003", "004", "009", "012"]
			grades.keys.sort.each do |key|
				csv << [key.split(' ').first, key.split(' ').last, grades[key]].flatten	
			end
	end
end	