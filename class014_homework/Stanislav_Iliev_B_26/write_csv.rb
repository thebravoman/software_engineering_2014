def write_to_CSV(result)
	classes = " "," ","VH","002","003","004","009","012"
	CSV.open("results_Stanislav_Iliev_B_26.csv","w") do |csv|
		csv << classes
		result.keys.each do |key|
			key_split = key.split(",")
			csv << [key_split,result[key]].flatten
		end
	end
end
