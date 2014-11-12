require "rexml/document"

class Drawer

	attr_writer :file_name
	attr_reader :file_name
	
	attr_accessor :x
	attr_accessor :y
	
	def initialize file_name="results_Lubomir_Yankov_A_16.svg",x=200,y=200
		
		self.file_name = file_name
		self.x = x
		self.y = y
	
	end
	
	def rect w, h, i, col
		
		r= @el_svg.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = self.x+i
		r.attributes["y"] = self.y-h
		r.attributes["stroke"] = "black"
		r.attributes["stroke-width"] = "4"
		r.attributes["fill"] = "#{col}"
	
	end

	def start
		
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	
	end
	
	def text value, x, y, size
		t = @el_svg.add_element "text"
		t.attributes["x"] = x + self.x
		t.attributes["y"] = self.y - y
		t.attributes["font-size"] = size
		t.text = value
	end

	def line x1,y1,x2,y2
	  
	  l = @el_svg.add_element "line"
	  l.attributes["x1"] = x1+self.x
	  l.attributes["x2"] = x2+self.x
	  l.attributes["y1"] = y1+self.y
	  l.attributes["y2"] = y2+self.y
	  l.attributes["style"] = "stroke:black;stroke-width:5"
	
	end
	
	def cs
		
		line(0,0,0,-450)
		line(700,0,0,0)
	
	end
	
	def finish
		
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end
	
	end
	
	def write (results)
	
		vh = 0; c2 = 0; c3 = 0; c4 = 0; c9 = 0; c12 = 0
		
		results.keys.each do |name|

			vh += results[name][0].to_i
			c2 += results[name][1].to_i
			c3 += results[name][2].to_i
			c4 += results[name][3].to_i
			c9 += results[name][4].to_i
			c12 += results[name][5].to_i

		end

		vh = vh * 3
		c2 = c2 * 3
		c3 = c3 * 3
		c4 = c4 * 3
		c9 = c9 * 3
		c12 = c12 * 3

		drawer = Drawer.new "results_Lubomir_Yankov_A_16.svg", 37,470
		drawer.start
		drawer.cs
		drawer.text "Statistics", 250, 400, 72
		drawer.text "VH", 35, -20, 24
		drawer.text "002", 135, -20, 24
		drawer.text "003", 235, -20, 24
		drawer.text "004", 335, -20, 24
		drawer.text "009", 435, -20, 24
		drawer.text "012", 535, -20, 24
		drawer.rect 70, vh, 15, "orange"
		drawer.rect 70, c2, 115, "yellow"
		drawer.rect 70, c3, 215, "orange"
		drawer.rect 70, c4, 315, "yellow"
		drawer.rect 70, c9, 415, "orange"
		drawer.rect 70, c12, 515, "yellow"
		drawer.text "Points", 19, 40, 24
		drawer.text "Points", 119, 40, 24
		drawer.text "Points", 219, 40, 24
		drawer.text "Points", 319, 40, 24
		drawer.text "Points", 419, 40, 24
		drawer.text "Points", 519, 40, 24
		drawer.text "#{(vh/3).to_s}", 35, 20, 24
		drawer.text "#{(c2/3).to_s}", 135, 20, 24
		drawer.text "#{(c3/3).to_s}", 235, 20, 24
		drawer.text "#{(c4/3).to_s}", 335, 20, 24
		drawer.text "#{(c9/3).to_s}", 435, 20, 24
		drawer.text "#{(c12/3).to_s}", 535, 20, 24

		drawer.finish

	end

end

