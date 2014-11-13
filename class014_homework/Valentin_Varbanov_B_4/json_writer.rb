class JSONWriter
	def write (hash)
		
		#Mighty JSON source :D
		File.open("results_Valentin_Varbanov_B_4.json", 'w') {
			|file|
			file.write("\"results\": {\n")
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
			File.open("results_Valentin_Varbanov_B_4.json", 'a') {
				|file|
				file << "\"student\": {\n"
				file << "\"first-name\": \"#{first_name}\"\n"
				file << "\"last-name\": \"#{last_name}\"\n"
				file << "\"vhodno-nivo\": \"#{result[0]}\"\n"
				file << "\"homework002\": \"#{result[1]}\"\n"
				file << "\"homework003\": \"#{result[2]}\"\n"
				file << "\"homework004\": \"#{result[3]}\"\n"
				file << "\"homework009\": \"#{result4}\"\n"
				file << "\"homework012\": \"#{result5}\"\n"
				file << "}\n"
			}
	
		end
		
		File.open("results_Valentin_Varbanov_B_4.json", 'a') {
			|file|
			file << "}\n"
		}
	end
end
