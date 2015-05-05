class XMLWriter
	def write(results)
		xml = File.open("result.xml", "w")
		xml.puts("<students>")
		results.each do |name|
			xml.puts("	<name>#{name}</name>")
		end
		xml.puts("</students>")
		xml.close
	end
end
