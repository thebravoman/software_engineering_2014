
class XMLWriter
	def write(results)
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
			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
