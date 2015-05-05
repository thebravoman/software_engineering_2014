def write_to_CSV(results)
	CSV.open("results_Stanislav_Iliev_B_26.csv","w") do |csv|
		csv << [" ", " ", "VH", "002", "003", "004", "009", "012"].flatten
		results.each do |student, result|
			csv << [student.split(' ')[0], student.split(' ')[1], result].flatten
		end
	end
end
