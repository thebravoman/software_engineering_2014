class CSVWriter
	def write data
		CSV.open("results_Stanimir_Bogdanov_A_24.csv","w") do |csv|
			csv << ["First Name", "Last Name" , "VH", "002", "003", "004", "009", "012"].flatten
			data.each do |key, value|
				csv << [key.split("_").first, key.split("_").last, value].flatten
			end
		end
	end
end
