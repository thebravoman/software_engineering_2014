class XMLwriter
	def write(names)
		n = 0
		File.open("results.xml", "w") do |xml|
			xml.puts("	<numbers>")
			names.each do |first|
					xml.puts("		<number> #{first} </number>")	
			end
			xml.puts("	</numbers>")
		end
		
	end
end

