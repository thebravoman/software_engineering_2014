def bar(parent, x, y, w, h)
  	parent.puts("<rect x=\"#{x}\" y=\"#{y}\" width=\"#{w}\" height=\"#{h}\" style=\"fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)\" />")
	return parent
end

def initTable(parent)
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"600\" y2=\"280\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"50\" y2=\"30\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<text x=\"60\" y=\"290\" fill=\"black\">VH</text>")
	parent.puts("<text x=\"111\" y=\"290\" fill=\"black\">002</text>")
	parent.puts("<text x=\"162\" y=\"290\" fill=\"black\">003</text>")
	parent.puts("<text x=\"213\" y=\"290\" fill=\"black\">004</text>")
	parent.puts("<text x=\"264\" y=\"290\" fill=\"black\">009</text>")
	parent.puts("<text x=\"315\" y=\"290\" fill=\"black\">012</text>")
	return parent
end

def convertResults(results)
	statistic = Array.new(6, 0)	
	results.keys.each do |key|
		statistic[0] += results[key]["VH"]
		statistic[1] += results[key]["002"]
		statistic[2] += results[key]["003"]
		statistic[3] += results[key]["004"]
		statistic[4] += results[key]["009"]
		statistic[5] += results[key]["012"]
	end
	return statistic
end

class SVGWriter 
	def write(results)
		statistic = convertResults(results)
		svg = File.open("results_Radoslav_Kostadinov_A_22.svg", "w")
		svg.puts("<svg width=\"680\" height=\"440\">")
		svg = initTable(svg)
		x = 51
		statistic.each do |count|
			svg = bar(svg, x, 280 - count, 50, count)
			x += 51
		end
		svg.puts("</svg>") 
	end
end



