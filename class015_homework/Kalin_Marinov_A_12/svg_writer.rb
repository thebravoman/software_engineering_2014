require 'rexml/document'
include REXML

class SVGWriter

	def write_rect x, height, width, y, color
		rect = Document.new
		rect = rect.add_element "rect"
		rect.attributes["height"] = height
		rect.attributes["width"] = width
		rect.attributes["x"] = x
		rect.attributes["y"] = y
		rect.attributes["style"] = "fill:rgb(#{ color*40 }, 0, 255);stroke-width:2;stroke:rgb(0,0,0)"
		rect
	end

	def write_line x1, y1, x2, y2
		line = Document.new
		line = line.add_element "line"
		line.attributes["x1"] = x1
		line.attributes["y1"] = y1
		line.attributes["x2"] = x2
		line.attributes["y2"] = y2
		line.attributes["style"] = "stroke:rgb(255,0,0);stroke-width:2"
		line
	end
	
	def write_text x, y, text_to_write
		text = Document.new
		text = text.add_element "text"
		text.attributes["x"] = x
		text.attributes["y"] = y
		text.attributes["style"] = "stroke:rgb(0,51,0);stroke-width:0.1;"
		text.text = text_to_write
		text
 	end

	def svg_init width, height
		svg = Document.new
		svg = svg.add_element("svg")
		svg.attributes["version"] = "1.1"
		svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
		svg.attributes["width"] = width
		svg.attributes["height"] = height
		svg
	end

	def cal_x index
		index*60+50
	end

	def write name, name_of_folder, folder_names

		svgb = svg_init cal_x(folder_names.size-2), 330
		
		svgb.add_element write_line 40, 20, 40, 300
		svgb.add_element write_line 40, 300, cal_x(folder_names.size-2), 302
		(folder_names.size-2).times do |index|
			total_result = 0
			name.each { |_, value| total_result += value[index] if value[index] > 0 }
			case folder_names[index+2]
			when /g\d+/ then sub = 100
			when /y\d+/ then sub = 3	
			else sub = 1
			end
			x = cal_x index
			svgb.add_element(write_rect(x, total_result/sub, 45, 300-total_result/sub, sub))
			svgb.add_element(write_text(10 + x, 320, folder_names[index+2]))
			svgb.add_element(write_text(x, 300-total_result/sub-20, total_result))
		end

		File.open(name_of_folder + ".svg", "w") do |svg|
			svg.write(svgb)
		end
	
	end

end
