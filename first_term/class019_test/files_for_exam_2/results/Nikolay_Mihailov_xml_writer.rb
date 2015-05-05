class XMLWriter
	def write(results)
		xml_file = File.open("results.xml", "w")
		xml_file.puts("<numbers>")
		results.keys.sort.each do |key|			
			xml_file.puts("	<number>#{key},#{results[key]}</number>")
		end
		xml_file.puts("</numbers>")
		xml_file.close
	end
end
