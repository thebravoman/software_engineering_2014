class CSVWriter
	def write(results, header)
		file = File.open("results_Velislav_Kostov_B_7.csv", "w")
		
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



