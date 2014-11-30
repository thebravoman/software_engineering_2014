class CSVWriter 
	def write (seconds,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashstudents_017_1,hashstudents_017_2,hashflay002,hashflay003,hashflay012,hashflay014,hashflay015,hashflay017_1,hashflay017_2,hashflog002,hashflog003,hashflog012,hashflog014,hashflog015,hashflog017_1,hashflog017_2)
		Dir.chdir File.dirname(__FILE__)
		CSV.open("results_David_Georgiev_B_12.csv","w") do |csv|
			first_line = [seconds,' ',"VH","002","003","004","009","012","014","015","017-1","017-2","g2","g3","g12","g14","g15","g17-1","g17-2","y2","y3","y12","y14","y15","y17-1","y17-2"]
			csv << [first_line].flatten.compact
	 		hashstudents_vhodno.sort.each do |key, value|
				key1 = key.split(' ')
				csv << [key1[0], key1[1], value, hashstudents_002[key], hashstudents_003[key], hashstudents_004[key], hashstudents_009[key], hashstudents_012[key],hashstudents_014[key],hashstudents_015[key],hashstudents_017_1[key],hashstudents_017_2[key],hashflog002[key],hashflog003[key],hashflog012[key],hashflog014[key],hashflog015[key],hashflog017_1[key],hashflog017_2[key],hashflay002[key],hashflay003[key],hashflay012[key],hashflay014[key],hashflay015[key],hashflay017_1[key],hashflay017_2[key]].flatten.compact
			end
		end
	end
end
