

class CSVWriter 

	def write (hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		Dir.chdir File.dirname(__FILE__)
<<<<<<< HEAD
		CSV.open("results_ Konstantin_Vekilski_B_20.csv","w") do |csv|
=======
		CSV.open("results_Konstantin_Vekilski_B_20.csv","w") do |csv|
>>>>>>> 9caabfd60464ccd49063e997e2084628facfa5b7
			first_line = [' ',' ',"VH","002","003","004","009","012"]
			csv << [first_line].flatten.compact

	 		hashstudents.sort.each do |key, value|
				key1 = key.split(' ')
				csv << [key1[0], key1[1], value, hashstudents3[key], hashstudents4[key], hashstudents2[key], hashstudents6[key], hashstudents5[key]].flatten.compact
			end
		end
	end


end
