require 'csv'

class CSVWriter

	def write tempHash
		File.open("result.csv", "w") do |f|
			tempHash.each do |key, value|
				f.puts "#{key},#{value.split(",").first}"
			end
		end
	end

end
