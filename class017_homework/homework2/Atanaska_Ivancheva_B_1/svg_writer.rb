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

		deff = ["VH", "002", "004", "009", "012", "014", "015", "017x1", "017x2"]

		#bars
		i = 100
		deff.each do |f|
			bar(@el_svg, 60, count(results, "#{f}")*15, i, 0)
			i = i + 110
		end

		#classes
		i = 100
		deff.each do |f|
			text("#{f}", i, 200)
			i = i + 110
		end
		
		#submitted homeworks
		i = 100
		deff.each do |f|
			text("#{count(results, "#{f}")}", i, count(results, "#{f}")*15+20)
			i = i+ 110
		end

		File.open("results_Atanaska_Ivancheva_B_1.svg", "w") do |f|
			f << doc.to_s
		end	
	end
end
