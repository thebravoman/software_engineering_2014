class HTMLWriter
	def write (students_list, vhodno_nivo_res, homework2_res, homework3_res, homework4_res, mapping_res, homework12_res)
		array_count = 0
		
		#Create the mighty HTML
		File.open('results_Gergan_Nikolov_B_11.html', 'w') { 
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
		
		while array_count < students_list.length
			File.open('results_Gergan_Nikolov_B_11.html', 'a') {
				|file|
				file.write ("<tr>\n")
				file << "<td>#{students_list[array_count].split('_')[0]}</td><>\n"
				file << "<td>#{students_list[array_count].split('_')[1]}</td>\n"
				file << "<td>#{vhodno_nivo_res[array_count]}</td>\n"
				file << "<td>#{homework2_res[array_count]}</td>\n"
				file << "<td>#{homework3_res[array_count]}</td>\n"
				file << "<td>#{homework4_res[array_count]}</td>\n"
				file << "<td>#{mapping_res[array_count]}</td>\n"
				file << "<td>#{homework12_res[array_count]}</td>\n"
				file.write ("</tr>\n")
			}
			
			array_count += 1
		end
		
		File.open('results_Gergan_Nikolov_B_11.html', 'a') {
			|file|
			file << "</table>\n"
			file << "</body>\n"
			file << "</html>\n"
		}
	end
end
