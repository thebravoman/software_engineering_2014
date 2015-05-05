class XMLWriter
	def write(results)
		file = File.open("results_Hristiyan_Dodov_B_29.xml","w")
		
		file.puts "\
<results>"
		
		results.each_with_index do |(k,v),index|
		
			file.print "\
	<student>
		<first_name>#{k.split('_')[0]}</first_name>
		<last_name>#{k.split('_')[1]}</last_name>
		<hwVH>#{v[0]}</hwVH>
		<hw002>#{v[1]}</hw002>
		<hw003>#{v[2]}</hw003>
		<hw004>#{v[3]}</hw004>
		<hw009>#{v[4]}</hw009>
		<hw012>#{v[5]}</hw012>
	</student>
"

		end
		
		file.print "\
</results>"

	end
end

$end
