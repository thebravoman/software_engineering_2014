require 'yaml'
def bar(parent, x, y, w, h)
  	parent.puts("<rect x=\"#{x}\" y=\"#{y}\" width=\"#{w}\" height=\"#{h}\" style=\"fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)\" />")
	return parent
end

def initTable(parent)
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"600\" y2=\"280\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<line x1=\"50\" y1=\"280\" x2=\"50\" y2=\"30\" style=\"stroke:rgb(0,0,0);stroke-width:2\" />")
	parent.puts("<text x=\"60\" y=\"295\" fill=\"black\">VH</text>")
	parent.puts("<text x=\"111\" y=\"295\" fill=\"black\">002</text>")
	parent.puts("<text x=\"162\" y=\"295\" fill=\"black\">003</text>")
	parent.puts("<text x=\"213\" y=\"295\" fill=\"black\">004</text>")
	parent.puts("<text x=\"264\" y=\"295\" fill=\"black\">009</text>")
	parent.puts("<text x=\"315\" y=\"295\" fill=\"black\">012</text>")
	parent.puts("<text x=\"366\" y=\"295\" fill=\"black\">014</text>")
	parent.puts("<text x=\"417\" y=\"295\" fill=\"black\">015</text>")
	parent.puts("<text x=\"310\" y=\"430\" fill=\"black\">Bar chart with the number of 1s.</text>")
	return parent
end

def convertResults(results,hw_count)
	statistic = Array.new(hw_count, 0)	
	results.each do |key,hw_hash|
		for i in 1 .. hw_count
			statistic[i-1] += hw_hash.values_at("homework_#{i}").first.to_i%2
		end 
	end
	return statistic
end

class SVGWriter 
	@@config = ""
	def self.write(results,config_file_path)
	@@config = YAML.load_file(config_file_path)
	homework_header = @@config["headers"]["homeworks"]
	hw_count = @@config["homeworks_count"]
	res_out_name = @@config["headers"]["result_output_name"]

	
	statistic = convertResults(results,hw_count)
		svg = File.open("#{res_out_name}.svg", "w")
		svg.puts("<svg width='680' height='440' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>")
		svg = initTable(svg)
		x = 51
		statistic.each do |count|
			svg = bar(svg, x, 280 - count * 3, 50, count * 3)
			xText = x + 12
			y = 277 - count * 3
			svg.puts("<text x=\"#{xText}\" y=\"#{y}\" fill=\"black\">#{count}</text>")
			x += 51
		end
		svg.puts("</svg>") 
	end
end



