class HTMLWriter
	def write (hash)
		array_count = 0
		
		#Create the mighty HTML
		File.open('results_Mladen_Karadimov_B_24.html', 'w') { 
			|file| 
			file.write ("<html>\n") 
			file.write ("<head>\n")
			file.write ("<title>HTML Results</title>\n")
			file.write ("</head>\n")
			file.write ("<body>\n")
			file.write ("<table border = \"1\">")
			file.write ("<tr>\n")
			file.write ("<th></th>\n")
			file.write ("<th></th>\n")
			file.write ("<th>VH</th>\n")
			file.write ("<th>002</th>\n")
			file.write ("<th>003</th>\n")
			file.write ("<th>004</th>\n")
			file.write ("<th>009</th>\n")
			file.write ("<th>012</th>\n")
			file.write ("</tr>\n")
		}
		
		hash.each do |name,result|
			if name != nil
						first_name = name.split(' ').first
						last_name = name.split(' ').last
						result =  result.split(',')
						result4 = result[4]
						if result4 == nil then result4 = 0 end
						result5 = result[5]
						if result5 == nil then result5 = 0 end
			end
			File.open('results_Mladen_Karadimov_B_24.html', 'a') {
				|file|
				file.write ("<tr>\n")
				file << "<td>#{first_name}</td>\n"
				file << "<td>#{last_name}</td>\n"
				file << "<td>#{result[0]}</td>\n"
				file << "<td>#{result[1]}</td>\n"
				file << "<td>#{result[2]}</td>\n"
				file << "<td>#{result[3]}</td>\n"
				file << "<td>#{result4}</td>\n"
				file << "<td>#{result5}</td>\n"
				file.write ("</tr>\n")
			}
			
			array_count += 1
		end
		
		File.open('results_Mladen_Karadimov_B_24.html', 'a') {
			|file|
			file << "</table>\n"
			file << "</body>\n"
			file << "</html>\n"
		}
	end
end
