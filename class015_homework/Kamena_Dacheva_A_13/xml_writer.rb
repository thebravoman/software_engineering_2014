class XMLWriter
	def write results,time
		xml = File.open("results_Kamena_Dacheva_A_13.xml", "w")
		xml.puts("<results>")
		xml.puts("<Time> #{time} </Time>")
		results.keys.sort.each do |key|
			xml.puts("<student>")
			xml.puts("<Name> #{key} </Name>")
			xml.puts("<VhodnoNivo> #{results[key][0]} </VhodnoNivo>")
			xml.puts("<folder2> #{results[key][1]} </folder2>")
			xml.puts("<folder3> #{results[key][2]} </folder3>")
			xml.puts("<folder4> #{results[key][3]} </folder4>")
			xml.puts("<folder9> #{results[key][4]} </folder9>")
			xml.puts("<folder12> #{results[key][5]} </folder12>")
			xml.puts("<folder14> #{results[key][6]} </folder14>")
			xml.puts("<g1> #{results[key][7]} </g1>")
			xml.puts("<g2> #{results[key][8]} </g2>")
			xml.puts("<g3> #{results[key][9]} </g3>")
			xml.puts("<g4> #{results[key][10]} </g4>")
			xml.puts("<g9> #{results[key][11]} </g9>")
			xml.puts("<g12> #{results[key][12]} </g12>")
			xml.puts("<g14> #{results[key][13]} </g14>")
			xml.puts("<y1> #{results[key][14]} </y1>")
			xml.puts("<y2> #{results[key][15]} </y2>")
			xml.puts("<y3> #{results[key][16]} </y3>")
			xml.puts("<y4> #{results[key][17]} </y4>")
			xml.puts("<y5> #{results[key][18]} </y5>")
			xml.puts("<y6> #{results[key][19]} </y6>")
			xml.puts("</student>")
		end
		xml.puts("</results>")
	xml.close
	end
end
