class JSONWriter
	def write(results, header, time)
		file = File.open("results_Vladimir_Yordanov_B_9.json","w")
		file.puts "{"
		
		results.each_with_index do |(k,v),index|
		
			file.puts "\t\"#{k.split('_')[0]} #{k.split('_')[1]}\"\:{"
			for i in 0..v.length-1
				file.print "\t\t\"#{header[i]}\":#{v[i]}"
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
