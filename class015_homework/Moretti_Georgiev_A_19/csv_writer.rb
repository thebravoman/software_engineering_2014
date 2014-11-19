class CsvWriter
	def write(student)
		CSV.open("results_Moretti_Georgiev_A_19.csv", "w") do |csv|
			csv << ["FirstName LastName","VH","002","003","004","009","012", "014"]#just print this on top of the csv file
			student.keys.sort.each do |key|
			#write the results in the csv file
				csv << [key, student[key].values].flatten
			end
		end
	end
end