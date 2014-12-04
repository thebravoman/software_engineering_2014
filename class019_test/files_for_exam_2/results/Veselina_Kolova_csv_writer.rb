require 'csv'

class CSVWriter
	def write (results)
		CSV.open("results.csv", "w") do |csv|
			results.each do |k, v|
				csv << [k]
			end
		end
	end
end

