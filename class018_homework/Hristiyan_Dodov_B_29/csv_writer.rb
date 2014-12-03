class CSVWriter
	def write(results, header, time)
		file = File.open("results_Hristiyan_Dodov_B_29.csv", "w")
		
		file.print "Time: #{time/60}m #{time%60}s,,"
		for i in 0..header.length-1 do
			if i>0; file.print ","; end
			file.print "#{header[i]}"
		end
		file.puts
		
		results.each do |k,v| 
			file.print k.split('_')[0] + ',' + k.split('_')[1]
	
			for i in 0..v.length-1 do	# -1 because of loop bug
				file.print(","); file.print(v[i])
			end
	
			file.puts # go to next line after writing everything about a student
		end
	end
end



