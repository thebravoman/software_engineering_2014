
class JSONWriter

	def write (results,argv_number)
		argv_number_counter = 0
		titles = Hash.new(0)
		Dir.chdir File.dirname(__FILE__)
		json = File.new("results_David_Georgiev_B_12.json", "w+")
		json.puts "{"
		results.sort.each do |key,value|
			results[key].sort.each do |k,v|
				titles[k] = 1
			end
		end
		titles.sort.each do |k,v|
			results.sort.each do |key,value|
				if results[key][k] == nil then
					results[key][k] = 0
				end
			end
		end
		results.sort.each do |key,value|
			argv_number_counter += 1
			if (argv_number_counter <= argv_number) then
				json.write "\"#{key}\" : { "
				results[key].sort.each do |k,v|
					json.write "\"#{k}\":#{v}, "
				end
				json.puts " }, "
			end
		end
		json.puts "}"
		json.close
	end

end


