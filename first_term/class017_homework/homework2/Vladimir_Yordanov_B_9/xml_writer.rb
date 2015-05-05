class XMLWriter
	def write(results)
		file = File.open("results_Vladimir_Yordanov_B_9.xml","w")
		
		file.puts "\
<results>"
		
		$students.sort.to_a.each do |k,v|
		
			file.print "\
	<student>
		<first_name>#{k.split(',')[0]}</first_name>
		<last_name>#{k.split(',')[1]}</last_name>
		<VH>#{$students[k]['01']}</VH>
		<002>#{$students[k]['02']}</002>
		<003>#{$students[k]['03']}</003>
		<004>#{$students[k]['04']}</004>
		<009>#{$students[k]['09']}</009>
		<012>#{$students[k]['12']}</012>
		<014>#{$students[k]['14']}</014>
		<g2>#{$students[k]['g2']}</g2>
		<g3>#{$students[k]['g3']}</g3>
		<g4>#{$students[k]['g4']}</g4>
		<g12>#{$students[k]['g12']}</g12>
		<g14>#{$students[k]['g14']}</g14>
		<y2>#{$students[k]['y2']}</y2>
		<y3>#{$students[k]['y3']}</y3>
		<y4>#{$students[k]['y4']}</y4>
		<y12>#{$students[k]['y12']}</y12>
		<y14>#{$students[k]['y14']}</y14>
	</student>
"

		end
		
		file.print "\
</results>"

	end
end

$end
