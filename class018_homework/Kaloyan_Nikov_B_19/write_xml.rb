def write_to_XML(results,time,name)
	classes = "VH", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1"
	i = 0
	File.open("#{name}.xml", "w") do |file|
		file.puts("<results>")
		results.sort.each do |name, val|
			file.puts("\t<student>")
			file.puts("\t\t<FirstName>#{name.split(' ')[0]}</FirstName>")
			file.puts("\t\t<LastName>#{name.split(' ')[1]}</LastName>")
			classes.each do |hw|
				file.puts("\t\t<#{hw}>#{val[i]}</#{hw}>")
				i += 1
			end
		end
		file.puts("</results>")
	end
end
