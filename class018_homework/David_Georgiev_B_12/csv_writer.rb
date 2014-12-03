class CSVWriter 

	def write (seconds,results)
		titles = Hash.new(0)
		first_line = "#{seconds}, "
		Dir.chdir File.dirname(__FILE__)
		csv = File.new("results_David_Georgiev_B_12.csv", "w+")
			results.sort.each do |key,value|
				#print "#{key} - "
				results[key].sort.each do |k,v|
					#print "#{k}"
					#print "[#{v}]"
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
					#print "#{k}"
					csv.write ",#{v}"
				end
				csv.puts ""
			end
	end
end
