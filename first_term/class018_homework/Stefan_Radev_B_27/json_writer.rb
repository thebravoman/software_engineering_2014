require 'json'

class JSONwriter
	def write(time_program, results)
		File.open('results_Stefan_Radev_B_27.json', 'a') do |json|
			json << "\"time\""":""\"#{time_program}\"\n"
			results.keys.sort.each do |k, v|
				json << "\"student\""":"" {\n"
				json << "\t\"FirstName\""":"" \"#{k.split("_")[0]}\"\n"
				json << "\t\"LastName\""":"" \"#{k.split("_")[1]}\"\n"
				json << "\t\"VH\""":"" \"#{results[k].values[0]}\"\n"
				json << "\t\"002\""":"" \"#{results[k].values[1]}\"\n"
				json << "\t\"003\""":"" \"#{results[k].values[2]}\"\n"
				json << "\t\"004\""":"" \"#{results[k].values[3]}\"\n"
				json << "\t\"009\""":"" \"#{results[k].values[4]}\"\n"
				json << "\t\"012\""":"" \"#{results[k].values[5]}\"\n"
				json << "\t\"014\""":"" \"#{results[k].values[6]}\"\n"
				json << "\t\"015\""":"" \"#{results[k].values[7]}\"\n"
				json << "\t\"017h1\""":"" \"#{results[k].values[8]}\"\n"
				json << "\t\"017h2\""":"" \"#{results[k].values[9]}\"\n"
				json << "\t\"018\""":"" \"#{results[k].values[10]}\"\n"
				json << "\t\"g2\""":"" \"#{results[k].values[11]}\"\n"
				json << "\t\"g3\""":"" \"#{results[k].values[12]}\"\n"
				json << "\t\"g4\""":"" \"#{results[k].values[13]}\"\n"
				json << "\t\"g12\""":"" \"#{results[k].values[14]}\"\n"
				json << "\t\"g14\""":"" \"#{results[k].values[15]}\"\n"
				json << "\t\"g15\""":"" \"#{results[k].values[16]}\"\n"
				json << "\t\"g17h1\""":"" \"#{results[k].values[17]}\"\n"
				json << "\t\"g17h2\""":"" \"#{results[k].values[18]}\"\n"
				json << "\t\"g18\""":"" \"#{results[k].values[19]}\"\n"
				json << "\t\"y2\""":"" \"#{results[k].values[20]}\"\n"
				json << "\t\"y3\""":"" \"#{results[k].values[21]}\"\n"
				json << "\t\"y4\""":"" \"#{results[k].values[22]}\"\n"
				json << "\t\"y12\""":"" \"#{results[k].values[23]}\"\n"
				json << "\t\"y14\""":"" \"#{results[k].values[24]}\"\n"
				json << "\t\"y15\""":"" \"#{results[k].values[25]}\"\n"
				json << "\t\"y17h1\""":"" \"#{results[k].values[26]}\"\n"
				json << "\t\"y17h2\""":"" \"#{results[k].values[27]}\"\n"
				json << "\t\"y18\""":"" \"#{results[k].values[28]}\"\n"
				json << "}\n"
				json << "\n"
			end
			
		end
	end
end
