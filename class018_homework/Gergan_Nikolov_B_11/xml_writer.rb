class XMLWriter
	def write (hash, filename, order, time)
		File.open(filename + ".xml" ,'w') do |file|
			file << "<results>"
			hash.each do |name, result|
				file << "<student>\n"
				file << "<name>#{name}</name>\n"
				
				order.each do |key|
					if key.to_i != 0
						file << "<homework-#{key}>#{result[key]}</homework-#{key}>\n"
					else
						file << "<#{key}>#{result[key]}</#{key}>\n"
					end
				end
				
				file << "</student>\n"
			end
			file << "</results>"
		end
	end
end
