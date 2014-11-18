

class CSVWriter 

	def write (hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
		Dir.chdir File.dirname(__FILE__)
		CSV.open("results_David_Georgiev_B_12.csv","w") do |csv|
			first_line = [' ',' ',"VH","002","003","004","009","012","014"]
			csv << [first_line].flatten.compact

	 		hashstudents_vhodno.sort.each do |key, value|
				key1 = key.split(' ')
				csv << [key1[0], key1[1], value, hashstudents_002[key], hashstudents_003[key], hashstudents_004[key], hashstudents_009[key], hashstudents_012[key],hashstudents_014[key]].flatten.compact
			end
		end
	end


end

