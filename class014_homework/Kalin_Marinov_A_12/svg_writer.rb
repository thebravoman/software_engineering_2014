require 'rexml/document'
include REXML

class SVGWriter

	def write_rect number, height
		temp = Document.new.add_element('rect')
		temp.attributes["height"] = height
		temp.attributes["width"] = 20
		temp.attributes["x"] = number
		temp.attributes["y"] = 120 - height
		temp.attributes["style"] = "fill:rgb(0,127,0)"
		temp
	end

	def write name, name_of_folder
		results = Array.new(6, 0)
		name.each do |key, value|
			results.each_with_index do |_, index|
				results[index] += value[index]
			end
		end
		lines = Document.new.add_element("svg")
		lines.attributes["width"] = 180
		lines.attributes["height"] = 120
		results.each_with_index do |value, index|
			lines.add_element(write_rect(index*30, value))	
		end

		File.open(name_of_folder + ".svg", "w") do |svg|
			svg.write(lines)
		end
	
	end

end
