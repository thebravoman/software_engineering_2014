class JSONWriter
	def write (hash, filename, time)
		order = ["VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"]
		File.open(filename + ".json" ,'w') do |file|
			hash.each do |name, result|
				file << "\"student\": {\n\"name\": \"#{name}\"\n"
				
				order.each do |key|
					file << "\"#{key}\": \"#{result[key]}\"\n"
				end
				
				file << "}\n"
			end
		end
	end
	
end
