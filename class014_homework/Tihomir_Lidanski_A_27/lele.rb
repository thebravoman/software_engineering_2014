class XMLWriter
	def write results
		xml = File.open("results_Tihomir_Lidanski_A_27.xml", "w")
		xml.puts("<results>")
		grades.keys.sort.each do |key|
			xml.puts("<student>")
				xml.puts("<Name>#{key.split(' ').first}</Name>")
				xml.puts("<LastName>#{key.split(' ').last}</LastName>")
				xml.puts("<VhodnoNivo>#{grades[key][0]}</VhodnoNivo>")
				xml.puts("<Class2>#{grades[key][1]}</Class2>")
				xml.puts("<Class3>#{grades[key][2]}</Class3>")
				xml.puts("<Class4>#{grades[key][3]}</Class4>")
				xml.puts("<Class9>#{grades[key][4]}</Class9>")
				xml.puts("<Class12>#{grades[key][5]}</Class12>")
			xml.puts("</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end	