class JSONWriter
	def write (students_list, vhodno_nivo_res, homework2_res, homework3_res, homework4_res, mapping_res, homework12_res)
		array_count = 0
		
		#Mighty JSON source :D
		File.open('results_Gergan_Nikolov_B_11.json', 'w') {
			|file|
			file.write("\"results\": {\n")
		}	
		
		while array_count < students_list.length
			File.open('results_Gergan_Nikolov_B_11.json', 'a') {
				|file|
				file << "\"student\": {\n"
				file << "\"first-name\": \"#{students_list[array_count].split('_')[0]}\"\n"
				file << "\"last-name\": \"#{students_list[array_count].split('_')[1]}\"\n"
				file << "\"vhodno-nivo\": \"#{vhodno_nivo_res[array_count]}\"\n"
				file << "\"homework002\": \"#{homework2_res[array_count]}\"\n"
				file << "\"homework003\": \"#{homework3_res[array_count]}\"\n"
				file << "\"homework004\": \"#{homework4_res[array_count]}\"\n"
				file << "\"homework009\": \"#{mapping_res[array_count]}\"\n"
				file << "\"homework012\": \"#{homework12_res[array_count]}\"\n"
				file << "}\n"
			}
		
			array_count += 1
		end
		
		File.open('results_Gergan_Nikolov_B_11.json', 'a') {
			|file|
			file << "}\n"
		}
	end
end
