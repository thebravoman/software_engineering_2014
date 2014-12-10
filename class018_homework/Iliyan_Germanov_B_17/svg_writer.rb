def bar(svg, x, y, w, h)
	svg.puts("<rect x=\"#{x}\" y=\"#{y}\" width=\"#{w}\" height=\"#{h}\" style=\"fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)\" />")	
	return svg
end

def init_graph(svg)
	svg.puts("<text x=\"73\" y=\"295\" fill=\"black\">VH</text>")
	svg.puts("<text x=\"145\" y=\"295\" fill=\"black\">002</text>")
	svg.puts("<text x=\"217\" y=\"295\" fill=\"black\">003</text>")
	svg.puts("<text x=\"289\" y=\"295\" fill=\"black\">004</text>")
	svg.puts("<text x=\"361\" y=\"295\" fill=\"black\">009</text>")
	svg.puts("<text x=\"433\" y=\"295\" fill=\"black\">012</text>")
	svg.puts("<text x=\"505\" y=\"295\" fill=\"black\">014</text>")
	svg.puts("<text x=\"577\" y=\"295\" fill=\"black\">015</text>")
	svg.puts("<text x=\"649\" y=\"295\" fill=\"black\">017-1</text>")
	svg.puts("<line x1=\"50\" y1=\"280\" x2=\"720\" y2=\"280\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	svg.puts("<line x1=\"50\" y1=\"280\" x2=\"50\" y2=\"30\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	return svg
end

def convert_results(results)
	counter = Array.new(9,0)
	results.keys.each do |key|
		counter[0] += results[key]["VH"]%2 #getting only the 1s with mod 2 (2 % 2 = 0, 1 % 2 = 1, 0 % 2 = 0)
		counter[1] += results[key]["002"]%2
		counter[2] += results[key]["003"]%2
		counter[3] += results[key]["004"]%2
		counter[4] += results[key]["009"]%2
		counter[5] += results[key]["012"]%2
		counter[6] += results[key]["014"]%2
		counter[7] += results[key]["015"]%2
		counter[8] += results[key]["017-1"]%2
	end
	return counter
end

class SVGWriter
	def write(results, classes, time)
		svg = File.open("results_Iliyan_Germanov_B_17.svg", "w")
 		svg.puts("<svg width='720px' height='440px' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>")
		svg.puts("<text x=\"310\" y=\"430\" fill=\"black\">Bar chart with the number of 1s.</text>")
		counter = convert_results(results)
		svg = init_graph(svg)
		x = 51
		counter.each do |height|
			svg = bar(svg, x, 279 - height * 3, 70, height * 3)
			xText = x + 27
			y = 275 - height * 3
			svg.puts("<text x=\"#{xText}\" y=\"#{y}\" fill=\"black\">#{height}</text>")
			x += 72
		end
		svg.puts("</svg>")
		svg.close
	end
end


