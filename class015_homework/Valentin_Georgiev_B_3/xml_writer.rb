class XMLWriter
	def write (results)
		File.open("results_Valentin_Georgiev_B_3.xml", "w") do |r|
			r <<"<results>\n"
			results.sort.each do |k,v|
				r << "\t<student>\n"
				r << "\t\t<first>#{k.split("_")[0]}</first>\n"
				r << "\t\t<last>#{k.split("_")[1]}</last>\n"
				v.each do |classes, result|
					r << "\t\t<tag#{classes}>#{result}</tag#{classes}>\n"
				end
				r << "\t</student>\n"
			end
			r << "</results>"
		end
	end
	
end
