class JSONWriter
	def write(results)
		file = File.open("results_Hristiyan_Dodov_B_29.json","w")
		file.puts "{"
		
		results.each_with_index do |(k,v),index|
		
			file.print "\
\"#{k.split('_')[0]} #{k.split('_')[1]}\"\:\
{\"VH\":#{v[0]},\
\"002\":#{v[1]},\
\"003\":#{v[2]},\
\"004\":#{v[3]},\
\"009\":#{v[4]},\
\"012\":#{v[5]}}"
			if index < results.length - 1; file.print ","; end
			
			file.puts
		end
		
		file.print "}"
	end
end

$end
