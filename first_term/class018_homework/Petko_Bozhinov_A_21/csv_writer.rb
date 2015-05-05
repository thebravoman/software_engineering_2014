# csv writer
require 'csv'
class CSVWriter
	def write grades, time, tasks

		CSV.open("results_Petko_Bozhinov_A_21.csv","w") do |csv|
			csv << [time, tasks.keys, "g2", "g3", "g4", "g12", "g14", "g171", "g172", "y2", "y3", "y4", "y12", "y14", "y171", "y172"].flatten
			grades.keys.sort.each do |key|
				csv << [key, grades[key]].flatten	
			end
		end		
	end
end