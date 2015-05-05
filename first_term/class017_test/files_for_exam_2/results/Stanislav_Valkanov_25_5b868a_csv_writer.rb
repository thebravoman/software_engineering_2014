require 'csv'

class CSVWriter
	def write(student)
		CSV.open("results.csv", "w") do |csv| 
			student.sort.each do |key, value|
				csv << ["#{key}", "#{value}"]
			end
		end
	end
end
