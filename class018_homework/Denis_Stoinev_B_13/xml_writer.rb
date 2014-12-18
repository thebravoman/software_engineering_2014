class XMLWriter
	def write(results, classes, time)
		xml = File.open("results_Denis_Stoinev_B_13.xml", "w")
		xml.puts("<results>")
		xml.puts("\t<time> #{time} </time>")
		results.keys.sort.each do |key|	
			xml.puts("\t<student>")
			xml.puts("\t\t<FirstName> #{key.split("_").first} </FirstName>")
			xml.puts("\t\t<LastName> #{key.split("_").last} </LastName>")
			counter = 0
			results[key].values.each do |val|
				xml.puts("\t\t<#{classes[counter]}> #{val} </#{classes[counter]}>")
				counter += 1
			end
			xml.puts("\t</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
