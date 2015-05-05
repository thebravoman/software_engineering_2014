class CSVWriter
	def write(results)
		file = File.open("results_Hristiyan_Dodov_B_29.csv", "w")
		file.puts ",,VH,002,003,004,009,012"
		
		results.each do |k,v| 
			file.print k.split('_')[0] + ',' + k.split('_')[1]
	
			for i in 0..5 do
				file.print(","); file.print(v[i])
			end
	
			file.puts # go to next line after writing everything about a student
		end
	end
end



