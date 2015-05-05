class XMLWriter
	def write(results, flog, flay)
		xml = File.open("results_Iliyan_Germanov_B_17.xml", "w")
		xml.puts("<results>")
		results.keys.sort.each do |key|	
			xml.puts("	<student>")
			xml.puts("		<FirstName> #{key.split("_").first} </FirstName>")
			xml.puts("		<LastName> #{key.split("_")[1]} </LastName>")
			xml.puts("		<VH>  #{results[key]["VH"]}  </VH>")
			xml.puts("		<002> #{results[key]["002"]} </002>")
			xml.puts("		<003> #{results[key]["003"]} </003>")
			xml.puts("		<004> #{results[key]["004"]} </004>")
			xml.puts("		<009> #{results[key]["009"]} </009>")
			xml.puts("		<012> #{results[key]["012"]} </012>")
			xml.puts("		<014> #{results[key]["014"]} </014>")
			xml.puts("		<015> #{results[key]["015"]} </015>")
			xml.puts("		<g2> #{flog[key]["002"]} </g2>")
			xml.puts("		<g3> #{flog[key]["003"]} </g3>")
			xml.puts("		<g4> #{flog[key]["004"]} </g4>")
			xml.puts("		<g12> #{flog[key]["012"]} </g12>")
			xml.puts("		<g14> #{flog[key]["014"]} </g14>")
			xml.puts("		<g15> #{flog[key]["015"]} </g15>")
			xml.puts("		<y2> #{flay[key]["002"]} </y2>")
			xml.puts("		<y3> #{flay[key]["003"]} </y3>")
			xml.puts("		<y4> #{flay[key]["004"]} </y4>")
			xml.puts("		<y12> #{flay[key]["012"]} </y12>")
			xml.puts("		<y14> #{flay[key]["014"]} </y14>")
			xml.puts("		<y15> #{flay[key]["015"]} </y15>")
			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
