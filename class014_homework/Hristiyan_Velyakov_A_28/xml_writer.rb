class XMLWriter
	def write(results)
		xml = File.open("results_Hristiyan_Velyakov_A_28.xml", "w")
		xml.puts("<results>")
		results.keys.sort.each do |key|	
			xml.puts("	<student>")
			xml.puts("		<FirstName> #{key.split("_").first} </FirstName>")
			xml.puts("		<LastName> #{key.split("_")[1]} </LastName>")
			xml.puts("		<vhodno_nivo>  #{results[key]["vhodno_nivo"]}  </vhodno_nivo>")
			xml.puts("		<class002> #{results[key]["class002"]} </class002>")
			xml.puts("		<class003> #{results[key]["class003"]} </class003>")
			xml.puts("		<class004> #{results[key]["class004"]} </class004>")
			xml.puts("		<class009> #{results[key]["class009"]} </class009>")
			xml.puts("		<class012> #{results[key]["class012"]} </class012>")
			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
