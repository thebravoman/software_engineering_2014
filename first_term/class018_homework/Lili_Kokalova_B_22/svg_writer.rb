def bar(parent, x, y, w, h)
  	parent.puts("<rect x=\"#{x}\" y=\"#{y}\" width=\"#{w}\" height=\"#{h}\" style=\"fill:rgb(153,0,76);stroke-width:1;stroke:rgb(0,0,0)\" />")
	return parent
end

class SVGwriter 
	def write(time_program, results)
		number_1 = Array.new(11, 0)		
		results.keys.each do |key|
			number_1[0] += results[key]["VH"]%2
			number_1[1] += results[key]["002"]%2
			number_1[2] += results[key]["003"]%2
			number_1[3] += results[key]["004"]%2
			number_1[4] += results[key]["009"]%2
			number_1[5] += results[key]["012"]%2
			number_1[6] += results[key]["014"]%2
			number_1[7] += results[key]["015"]%2
			number_1[8] += results[key]["017h1"]%2
			number_1[9] += results[key]["017h2"]%2
			number_1[10] += results[key]["018"]%2
		end
		svg = File.open("results_Lili_Kokalova_B_22.svg", "w")
		svg.puts("<svg width='680' height='440' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>")
		svg.puts("<text x=\"200\" y=\"430\" fill=\"black\">Running time of the program: #{time_program} </text>")
		svg.puts("<line x1=\"50\" y1=\"300\" x2=\"600\" y2=\"300\" style=\"stroke:rgb(0,0,0);stroke-width:1\" />")
		svg.puts("<line x1=\"50\" y1=\"320\" x2=\"50\" y2=\"50\" style=\"stroke:rgb(0,0,0);stroke-width:1\" />")
		svg.puts("<text x=\"60\" y=\"320\" fill=\"black\">VH</text>")
		svg.puts("<text x=\"100\" y=\"320\" fill=\"black\">002</text>")
		svg.puts("<text x=\"150\" y=\"320\" fill=\"black\">003</text>")
		svg.puts("<text x=\"200\" y=\"320\" fill=\"black\">004</text>")
		svg.puts("<text x=\"250\" y=\"320\" fill=\"black\">009</text>")
		svg.puts("<text x=\"305\" y=\"320\" fill=\"black\">012</text>")
		svg.puts("<text x=\"355\" y=\"320\" fill=\"black\">014</text>")
		svg.puts("<text x=\"400\" y=\"320\" fill=\"black\">015</text>")
		svg.puts("<text x=\"450\" y=\"320\" fill=\"black\">017h1</text>")
		svg.puts("<text x=\"500\" y=\"320\" fill=\"black\">017h2</text>")	
		svg.puts("<text x=\"550\" y=\"320\" fill=\"black\">018</text>")
		x = 51
		number_1.each do |count|
			p number_1
			svg = bar(svg, x, 300 - count, 10, count)
			x += 51
		end
		svg.puts("</svg>") 
	end
end
