class XMLWriter
	def write(results, header, time)
		file = File.open("results_Hristiyan_Dodov_B_29.xml","w")
		
		file.puts "\
<results>"
		
		results.each_with_index do |(k,v),index|
			file.puts "\
	<student>
		<first_name>#{k.split('_')[0]}</first_name>
		<last_name>#{k.split('_')[1]}</last_name>"
		
			for i in 0..v.length-1 do
				file.puts "\t\t<r-#{header[i]}>#{v[i]}</r-#{header[i]}>"
			end
		
			file.print "\
	</student>
"
		end
		
		file.print "\
</results>"

	end
end

$end
