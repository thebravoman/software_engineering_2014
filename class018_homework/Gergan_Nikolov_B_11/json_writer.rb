class JSONWriter
	def write (hash, filename, order, time)
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
