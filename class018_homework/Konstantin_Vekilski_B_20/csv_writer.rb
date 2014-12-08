class CSVWriter 

	def write (seconds,results)
		titles = Hash.new(0)
		first_line = "#{seconds}, "
		Dir.chdir File.dirname(__FILE__)
		csv = File.new("results_Konstantin_Vekilski_B_20.csv", "w+")
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
			key1 = key.split(" ")
			csv.write "#{key1[0]}, #{key1[1]}"
			results[key].sort.each do |k,v|
				csv.write ",#{v}"
			end
			csv.puts ""
		end
		csv.close
	end
end
