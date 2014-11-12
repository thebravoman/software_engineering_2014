class XMLWriter
	def write(results)
		xml = File.open("results_Elena_Karakoleva_A_8.xml", "w")
		xml.puts("<results>")
		results.keys.sort.each do |key|
			xml.puts("<student>")
			xml.puts("<FirstName> #{key}</FirstName>")
			xml.puts("<VhodnoNivo> #{results[key][0]} </VhodnoNivo>")
			xml.puts("<folder2> #{results[key][1]} </folder2>")
			xml.puts("<folder3> #{results[key][2]} </folder3>")
			xml.puts("<folder4> #{results[key][3]} </folder4>")
			xml.puts("<folder9> #{results[key][4]} </folder9>")
			xml.puts("<folder12> #{results[key][5]} </folder12>")
			xml.puts("</student>")
		end
	xml.puts("</results>")
	xml.close
	end
end

