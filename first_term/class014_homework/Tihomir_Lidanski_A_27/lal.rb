require 'json'

class JSONWriter
	def write results
		File.open("results_Tihomir_Lidanski_A_27.json", "w") do |f|
			f.write(grades.to_json)
		end
	end
end	
