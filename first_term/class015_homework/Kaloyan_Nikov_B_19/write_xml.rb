def write_to_XML(results,time)
	File.open("results_Kaloyan_Nikov_B_19.xml", "w") do |file|
		file.puts("<results>")
		results.sort.each do |name, val|
			file.puts("\t<student>")
			file.puts("\t\t<FirstName>#{name.split(' ')[0]}</FirstName>")
			file.puts("\t\t<LastName>#{name.split(' ')[1]}</LastName>")
			file.puts("\t\t<VH>#{val[0]}</VH>")
			file.puts("\t\t<002>#{val[1]}</002>")
			file.puts("\t\t<003>#{val[2]}</003>")
			file.puts("\t\t<004>#{val[3]}</004>")
			file.puts("\t\t<009>#{val[4]}</009>")
			file.puts("\t\t<012>#{val[5]}</012>")
			file.puts("\t\t<014>#{val[6]}</014>")
			file.puts("\t\t<g2>#{val[7]}</g2>")
			file.puts("\t\t<g3>#{val[8]}</g3>")
			file.puts("\t\t<g4>#{val[9]}</g4>")
			file.puts("\t\t<g12>#{val[10]}</g12>")
			file.puts("\t\t<g14>#{val[11]}</g14>")
			file.puts("\t\t<y2>#{val[12]}</y2>")
			file.puts("\t\t<y3>#{val[13]}</y3>")
			file.puts("\t\t<y4>#{val[14]}</y4>")
			file.puts("\t\t<y12>#{val[15]}</y12>")
			file.puts("\t\t<y14>#{val[16]}</y14>")
			file.puts("\t</student>")
		end
		file.puts("</results>")
	end
end
