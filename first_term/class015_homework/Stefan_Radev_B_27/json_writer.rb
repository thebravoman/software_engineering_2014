require 'json'
class JSONwriter
	def write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, flog002, flog003, flog004, flog012, flog014)
		n = 0	
		File.open('results_Stefan_Radev_B_27.json', 'a') do |json|
			json << "\"time\""":""\"#{time_program}\"\n"
			all_students.each do |first, last|
				json << "\"student\""":"" {\n"
				json << "\t\"FirstName\""":"" \"#{first}\"\n"
				json << "\t\"LastName\""":"" \"#{last}\"\n"
				json << "\t\"resultVH\""":"" \"#{resultsVH[n]}\"\n"
				json << "\t\"result002\""":"" \"#{results002[n]}\"\n"
				json << "\t\"result003\""":"" \"#{results003[n]}\"\n"
				json << "\t\"result004\""":"" \"#{results004[n]}\"\n"
				json << "\t\"result009\""":"" \"#{results009[n]}\"\n"
				json << "\t\"result012\""":"" \"#{results012[n]}\"\n"
				json << "\t\"result014\""":"" \"#{results014[n]}\"\n"
				json << "\t\"g2\""":"" \"#{flog002[n]}\"\n"
				json << "\t\"g3\""":"" \"#{flog003[n]}\"\n"
				json << "\t\"g4\""":"" \"#{flog004[n]}\"\n"
				json << "\t\"g12\""":"" \"#{flog012[n]}\"\n"
				json << "\t\"g14\""":"" \"#{flog014[n]}\"\n"
				json << "}\n"
				json << "\n"
				n += 1
			end
			
		end
	end
end
