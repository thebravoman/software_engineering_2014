class XMLWriter
	def write(result,classes)
		xml_file = File.open("results_Nikolay_Mihailov_B_25.xml", "w")
		xml_file.puts("<results>")
		result.keys.sort.each do |key|
			key_split = key.split(",")
			key_split_ = key_split[0] + " " + key_split[1]
			
			xml_file.puts("		<student>")
			xml_file.puts("			<Name> #{key_split_} </Name>")
			class_index = 2			
			for i in 0..22 
				xml_file.puts("			<#{classes[class_index]}> #{result[key][i]} </#{classes[class_index]}>")
				class_index +=1			
			end
			xml_file.puts("		</student>")
		end
		xml_file.puts("</results>")
		xml_file.close
	end
end
