
class CSVWriter
	def write tempHash
		File.open("results.csv", "w") do |f|
		  tempHash.each do |key, value|
			f.puts "#{key.split(",").first},#{key.split(",").last}"
		  end
		end
	end
end
