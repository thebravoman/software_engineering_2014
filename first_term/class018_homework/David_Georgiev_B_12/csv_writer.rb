class CSVWriter 

	def write (seconds,results,argv_number)
		argv_number_counter = 0
		titles = Hash.new(0)
		first_line = "#{seconds}, "
		Dir.chdir File.dirname(__FILE__)
		csv = File.new("results_David_Georgiev_B_12.csv", "w+")
		results.sort.each do |key,value|
			results[key].sort.each do |k,v|
				titles[k] = 1
			end
		end
		titles.sort.each do |k,v|
			first_line = "#{first_line},#{k}"
			results.sort.each do |key,value|
				if results[key][k] == nil then
					results[key][k] = 0
				end
			end
		end
		csv.puts first_line
		results.sort.each do |key,value|
			argv_number_counter += 1
			if (argv_number_counter <= argv_number) then
				key1 = key.split(" ")
				csv.write "#{key1[0]}, #{key1[1]}"
				results[key].sort.each do |k,v|
					csv.write ",#{v}"
				end
				csv.puts ""
			end
		end
		csv.close
	end
end
