require 'csv'
class CSVWriter
	def write(results)
		CSV.open("results.csv",'w') do |csv|
			results.each do |res|
				csv << [res] 
			end
		end
	end
end
