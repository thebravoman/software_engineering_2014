# csv writer
require 'csv'
class CSVWriter
	def write grades
		CSV.open("results_Petko_Bozhinov_A_21.csv","w") do |csv|
			csv << ["", "", "VH", "002", "003", "004", "009", "012"]
			grades.keys.sort.each do |key|
				csv << [key.split(' ').first, key.split(' ').last, grades[key]].flatten	
			end
		end		
	end
end