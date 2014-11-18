class XMLWriter
	def write(result,classes)
		xml_file = File.open("results_Nikolay_Mihailov_B_25.xml", "w")
		xml_file.puts("<results>")
		result.keys.sort.each do |key|
			key_split = key.split(",")
			key_split_ = key_split[0] + " " + key_split[1]
			
			xml_file.puts("		<student>")
			xml_file.puts("			<Name> #{key_split_} </Name>")
			xml_file.puts("			<VH> #{result[key][0]} </VH>")
			xml_file.puts("			<002> #{result[key][1]} </002>")
			xml_file.puts("			<003> #{result[key][2]} </003>")
			xml_file.puts("			<004> #{result[key][3]} </004>")
			xml_file.puts("			<009> #{result[key][4]} </009>")
			xml_file.puts("			<012> #{result[key][5]} </012>")
			xml_file.puts("			<Flog12> #{result[key][6]} </Flog12>")
			xml_file.puts("			<Flay12> #{result[key][7]} </Flay12>")
			xml_file.puts("			<014> #{result[key][8]} </014>")
			xml_file.puts("			<Flog14> #{result[key][9]} </Flog14>")
			xml_file.puts("			<Flay14> #{result[key][10]} </Flay14>")
			xml_file.puts("		</student>")
		end
		xml_file.puts("</results>")
		xml_file.close
	end
end
