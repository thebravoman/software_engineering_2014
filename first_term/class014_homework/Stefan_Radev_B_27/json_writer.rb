require 'json'
class JSONwriter
	def write(all_students, resultsVH, results002, results003, results004, results009, results012)
		n = 0		
		all_students.each do |first, last|
			File.open('results_Stefan_Radev_B_27.json', 'a') do |json|
				json << "\"student\""":"" {\n"
				json << "\t\"FirstName\""":"" \"#{first}\"\n"
				json << "\t\"LastName\""":"" \"#{last}\"\n"
				json << "\t\"resultVH\""":"" \"#{resultsVH[n]}\"\n"
				json << "\t\"result002\""":"" \"#{results002[n]}\"\n"
				json << "\t\"result003\""":"" \"#{results003[n]}\"\n"
				json << "\t\"result004\""":"" \"#{results004[n]}\"\n"
				json << "\t\"result009\""":"" \"#{results009[n]}\"\n"
				json << "\t\"result012\""":"" \"#{results012[n]}\"\n"
				json << "}\n"
				json << "\n"
			end
			n += 1
		end
	end
end
