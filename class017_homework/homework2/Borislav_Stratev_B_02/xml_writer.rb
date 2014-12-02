class XMLWriter
	def write results,no_need_of_this_arg
		File.open("results_Borislav_Stratev_B_02.xml", "w") do |r|
			r <<"<results>\n"
			results.sort.each do |k,v|
				r << "\t<student>\n"
				r << "\t\t<first>#{k.split(" ")[0]}</first>\n"
				r << "\t\t<last>#{k.split(" ")[1]}</last>\n"
				i = 0
				v.each do |e|
					r << "\t\t<res>#{e}</res>\n"
					i = i + 1
				end
				r << "\t</student>\n"
			end
			r << "</results>"
		end
	end
	
end
