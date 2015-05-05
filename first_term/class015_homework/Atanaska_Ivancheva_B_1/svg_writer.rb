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
		df = 1000 - h - 30
		b.attributes["transform"] = "translate(0, #{df})"
		b.attributes["fill"] = "rgb(0, 250, 154)"
	end	

	def text (value, x, y)
		t = @el_svg.add_element "text"
		t.attributes["x"] = x
		t.attributes["y"] = 1000 - y 
		if y == 200 then
			t.attributes["fill"] = "black"
			t.attributes["font-size"] = "35px"
			t.attributes["transform"] = "translate(0, 190)"
		else
			t.attributes["fill"] = "white"
			t.attributes["font-size"] = "45px"
		#	t.attributes["transform"] = "translate(0, 500)"
		end
		t.text = value
	end

	def write (results)
		height = 1000
		width = 1500
		doc = REXML::Document.new
		@el_svg = doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
		@el_svg.attributes["height"] = "#{height}"
		@el_svg.attributes["width"] = "#{width}"

		bar(@el_svg, 60, count(results, "VH")*50, 100, 0)
		bar(@el_svg, 60, count(results, "002")*50, 210, 0)
		bar(@el_svg, 60, count(results, "003")*50, 320, 0)
		bar(@el_svg, 60, count(results, "004")*50, 430, 0)
		bar(@el_svg, 60, count(results, "009")*50, 540, 0)
		bar(@el_svg, 60, count(results, "012")*50, 650, 0)
		bar(@el_svg, 60, count(results, "014")*50, 650, 0)

		text("VH", 100, 200)
		text("002", 210, 200)
		text("003", 320, 200)
		text("004", 430, 200)
		text("009", 540, 200)
		text("012", 650, 200)
		text("014", 760, 200)
		
		text("#{count(results, "VH")}", 100, count(results, "VH")*50+20)
		text("#{count(results, "002")}", 210, count(results, "002")*50+20)
		text("#{count(results, "003")}", 320, count(results, "003")*50+20)
		text("#{count(results, "004")}", 430, count(results, "004")*50+20)
		text("#{count(results, "009")}", 540, count(results, "009")*50+20)
		text("#{count(results, "012")}", 650, count(results, "012")*50+20)
		text("#{count(results, "014")}", 760, count(results, "014")*50+20)

		File.open("results_Atanaska_Ivancheva_B_1.svg", "w") do |f|
			f << doc.to_s
		end	
	end
end
