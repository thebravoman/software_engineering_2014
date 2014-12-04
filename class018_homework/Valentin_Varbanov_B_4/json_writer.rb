class JSONWriter
	def write (hash, filename, time)
		order = ["vhodno_nivo", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "018", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "g18", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2", "y18"]
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
