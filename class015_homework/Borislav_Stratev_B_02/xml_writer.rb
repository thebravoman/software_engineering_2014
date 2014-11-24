class XMLWriter
	def write (results,time)
		File.open("results_Borislav_Stratev_B_02.xml", "w") do |r|
			a = ["Vh", "002", "003", "004", "009", "012","014","g002", "g003", "g004", "g012","g014","y002", "y003", "y004",  "y012","y014","\n"]
			r <<"<results>\n"
			results.sort.each do |k,v|
				r << "\t<student>\n"
				r << "\t\t<first>#{k.split(" ")[0]}</first>\n"
				r << "\t\t<last>#{k.split(" ")[1]}</last>\n"
				i = 0
				a.each do |classes|
					r << "\t\t<tag#{classes}>#{v[i]}</tag#{classes}>\n"
					i = i + 1
				end
				r << "\t</student>\n"
			end
			r << "</results>"
		end
	end
	
end
