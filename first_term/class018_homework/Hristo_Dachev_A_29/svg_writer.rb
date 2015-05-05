# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

def bar(parent, x, y, w, h)
	parent.puts("<rect x=\"#{x}\" y=\"#{y}\" width=\"#{w}\" height=\"#{h}\" style=\"fill:rgb(255,255,0);stroke-width:3;stroke:rgb(0,0,0)\" />")
	return parent
end

def initTable(parent)
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"600\" y2=\"280\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"50\" y2=\"30\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<text x=\"60\" y=\"300\" fill=\"black\" font-weight=\"bold\">VH</text>")
	parent.puts("<text x=\"111\" y=\"300\" fill=\"black\" font-weight=\"bold\">002</text>")
	parent.puts("<text x=\"162\" y=\"300\" fill=\"black\" font-weight=\"bold\">003</text>")
	parent.puts("<text x=\"213\" y=\"300\" fill=\"black\" font-weight=\"bold\">004</text>")
	parent.puts("<text x=\"264\" y=\"300\" fill=\"black\" font-weight=\"bold\">009</text>")
	parent.puts("<text x=\"315\" y=\"300\" fill=\"black\" font-weight=\"bold\">012</text>")
	parent.puts("<text x=\"366\" y=\"300\" fill=\"black\" font-weight=\"bold\">014</text>")
	return parent
end

def convertResults(results)
	statistic = Array.new(7, 0)	
	results.each do |key,hw_hash|
		statistic[0] += hw_hash.values_at("VH").first.to_i
		statistic[1] += hw_hash.values_at("002").first.to_i
		statistic[2] += hw_hash.values_at("003").first.to_i
		statistic[3] += hw_hash.values_at("004").first.to_i
		statistic[4] += hw_hash.values_at("009").first.to_i
		statistic[5] += hw_hash.values_at("012").first.to_i
		statistic[6] += hw_hash.values_at("014").first.to_i

	end
	return statistic
end

class SVGWriter 
	def write results, time
		statistic = convertResults(results)
		svg = File.open("results_Hristo_Dachev_A_29.svg", "w")

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
