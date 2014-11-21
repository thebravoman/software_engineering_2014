
class XMLwriter
	def write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, flog002, flog003, flog004, flog012, flog014)
		n = 0
		File.open("results_Lili_Kokalova_B_22.xml", "w") do |xml|
			xml.puts("<time> #{time_program} </time>")
			xml.puts("<results>")
			all_students.each do |first, last|
				xml.puts("	<student>") 
					xml.puts("		<FirstName> #{first} </FirstName>")
					xml.puts("		<LastName> #{last} </LastName>")
					xml.puts("		<resultsVH> #{resultsVH[n]} </resultsVH>")
					xml.puts("		<results002> #{results002[n]} </results002>")
					xml.puts("		<results003> #{results003[n]} </results003>")
					xml.puts("		<results004> #{results004[n]} </results004>") 
					xml.puts("		<results009> #{results009[n]} </results009>")
					xml.puts("		<results012> #{results012[n]} </results012>")
					xml.puts("		<results014> #{results014[n]} </results014>")	
					xml.puts("		<g2> #{flog002[n]} </g2>")
					xml.puts("		<g3> #{flog003[n]} </g3>")
					xml.puts("		<g4> #{flog004[n]} </g4>") 
					xml.puts("		<g12> #{flog012[n]} </g12>")
					xml.puts("		<g14> #{flog014[n]} </g14>")
				xml.puts("	</student>")
				n = n + 1 	
			end
			xml.puts("</results>")
		end
		
	end
end

