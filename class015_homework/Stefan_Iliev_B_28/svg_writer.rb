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
	results.each do |key,hw_hash|
		statistic[0] += hw_hash.values_at("entry_homework").first.to_i
		statistic[1] += hw_hash.values_at("homework_1").first.to_i
		statistic[2] += hw_hash.values_at("homework_2").first.to_i
		statistic[3] += hw_hash.values_at("homework_3").first.to_i
		statistic[4] += hw_hash.values_at("homework_4").first.to_i
		statistic[5] += hw_hash.values_at("homework_5").first.to_i
	end
	return statistic
end

class SVGWriter 
	def write(results)
		statistic = convertResults(results)
		svg = File.open("results_Stefan_Iliev_B_28.svg", "w")
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



