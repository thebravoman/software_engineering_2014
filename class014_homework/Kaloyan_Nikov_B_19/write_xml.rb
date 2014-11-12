def write_to_XML(results)
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
			file.puts("\t</student>")
		end
		file.puts("</results>")
	end
end
