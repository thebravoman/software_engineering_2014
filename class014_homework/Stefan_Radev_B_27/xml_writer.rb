
class XMLwriter
	def write(all_students, resultsVH, results002, results003, results004, results009, results012)
		n = 0
		File.open("results_Stefan_Radev_B_27.xml", "w") do |xml|
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
				xml.puts("	</student>")
				n = n + 1 	
			end
			xml.puts("</results>")
		end
		
	end
end

