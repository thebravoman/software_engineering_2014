class XMLWriter
	def write (hash)
		array_count = 0
		
		#Create the mighty XML
		File.open('results_Gergan_Nikolov_B_11.xml', 'w') { 
			|file| 
			file.write ("<results>\n") 
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
			File.open('results_Gergan_Nikolov_B_11.xml', 'a') {
				|file|
				file << "<student>"
				file << "<first_name>#{first_name}</first_name>"
				file << "<last_name>#{last_name}</last_name>"
				file << "<vh>Vhodno Nivo - #{result[0]}</vh>"
				file << "<homework>Homework2 - #{result[1]}</homework>"
				file << "<homework>Homework3 - #{result[2]}</homework>"
				file << "<homework>Homework4 - #{result[3]}</homework>"
				file << "<homework>Homework9 - #{result4}</homework>"
				file << "<homework>Homework12 - #{result5}</homework>"
				file << "</student>"
			}
			end
		
		
		File.open('results_Gergan_Nikolov_B_11.xml', 'a') {
			|file|
			file << "</results>\n"
		}
	end
end
