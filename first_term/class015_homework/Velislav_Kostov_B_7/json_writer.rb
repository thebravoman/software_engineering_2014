class JSONWriter
	def write(results, header)
		file = File.open("results_Velislav_Kostov_B_7.json","w")
		file.puts "{"
		
		results.each_with_index do |(k,v),index|
		
			file.puts "\t\"#{k.split('_')[0]} #{k.split('_')[1]}\"\:{"
			for i in 0..v.length-1
				file.print "\t\t\"#{header[i+2]}\":#{v[i]}"
				if i<v.length-1; file.print ","; end
				file.puts
			end
			file.print "\t}"

			if index < results.length - 1; file.print ","; end
			
			file.puts
		end
		
		file.print "}"
	end
end

$end
