require 'rexml/document'

class SVGWriter

	def count(results, i)
		numbs = 0
		results.each do |k, v|
			if v[i] == 1 then 
				numbs += 1
			end
		end
		return numbs
	end

	def bar(parent, w, h, x, y)
		b = parent.add_element "rect"
		b.attributes["width"] = w
		b.attributes["height"] = h
		b.attributes["x"] = x
		b.attributes["y"] = y
		df = 60 - h
		b.attributes["transform"] = "translate(0, #{df})"
		b.attributes["fill"] = "rgb(0, 250, 154)"
	end	

	def text (value, x, y)
		t = @el_svg.add_element "text"
		t.attributes["x"] = x
		t.attributes["y"] = y
		t.attributes["transform"] = "translate(0, 45)"
		t.attributes["fill"] = "black"
		t.attributes["font-size"] = "5px"
		t.text = value
	end

	def write (results)
		doc = REXML::Document.new
		@el_svg = doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
		@el_svg.attributes["height"] = "60"
		@el_svg.attributes["width"] = "100"

		bar(@el_svg, 10, count(results, "VH")*10, 0, 0)
		bar(@el_svg, 10, count(results, "002")*10, 21, 0)
		bar(@el_svg, 10, count(results, "003")*10, 32, 0)
		bar(@el_svg, 10, count(results, "004")*10, 43, 0)
		bar(@el_svg, 10, count(results, "009")*10, 54, 0)
		bar(@el_svg, 10, count(results, "012")*10, 65, 0)

		text("VH", 0, 0)
		text("002", 21, 0)
		text("003", 32, 0)
		text("004", 43, 0)
		text("009", 54, 0)
		text("012", 65, 0)

		File.open("results_Veselina_Kolova_B_8.svg", "w") do |f|
			f << doc.to_s
		end	
	end
end
