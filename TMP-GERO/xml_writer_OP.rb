class XMLWriter
	def write (students_list, vhodno_nivo_res, homework2_res, homework3_res, homework4_res, mapping_res, homework12_res)
		array_count = 0
		
		#Create the mighty XML
		File.open('results_Gergan_Nikolov_B_11.xml', 'w') { 
			|file| 
			file.write ("<results>\n") 
		}
		
		while array_count < students_list.length
			File.open('results_Gergan_Nikolov_B_11.xml', 'a') {
				|file|
				file << "<student>"
				file << "<first_name>#{students_list[array_count].split('_')[0]}</first_name>"
				file << "<last_name>#{students_list[array_count].split('_')[1]}</last_name>"
				file << "<vh>Vhodno Nivo - #{vhodno_nivo_res[array_count]}</vh>"
				file << "<homework>Homework2 - #{homework2_res[array_count]}</homework>"
				file << "<homework>Homework3 - #{homework3_res[array_count]}</homework>"
				file << "<homework>Homework4 - #{homework4_res[array_count]}</homework>"
				file << "<homework>Homework9 - #{mapping_res[array_count]}</homework>"
				file << "<homework>Homework12 - #{homework12_res[array_count]}</homework>"
				file << "</student>"
			}
			array_count += 1
		end
		
		File.open('results_Gergan_Nikolov_B_11.xml', 'a') {
			|file|
			file << "</results>\n"
		}
	end
end
