class XMLWriter
	def write student1
		xml = File.open("result.xml", "w")
		xml.puts("<students>")
			student1.sort.each do |name,num|
				xml.puts("<name>#{name}</name>")
			end
		xml.puts("</students>")
	xml.close
	end
end
