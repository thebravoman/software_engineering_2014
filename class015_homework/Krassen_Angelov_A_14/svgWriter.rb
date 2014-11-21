require "rexml/document"

class Drawer

	attr_writer :file_name
	attr_reader :file_name
	
	attr_accessor :x
	attr_accessor :y
	
	def initialize file_name="results_Krassen_Angelov_A_14.svg",x=200,y=200
		
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
	
	def write (results, end_time)
	
		vh = 0; c2 = 0; c3 = 0; c4 = 0; c9 = 0; c12 = 0;
		g2 = 0; g3 = 0; g4 = 0; g12 = 0; g14 = 0;
		y2 = 0; y3 = 0; y4 = 0; y12 = 0; y14 = 0;
		
		results.keys.each do |name|

			vh += results[name][0].to_i
			c2 += results[name][1].to_i
			c3 += results[name][2].to_i
			c4 += results[name][3].to_i
			c9 += results[name][4].to_i
			c12 += results[name][5].to_i
			
			g2 += results[name][7].to_i
			g3 += results[name][8].to_i
			g4 += results[name][9].to_i
			g12 += results[name][10].to_i
			g14 += results[name][11].to_i

			y2 += results[name][12].to_i
			y3 += results[name][13].to_i
			y4 += results[name][14].to_i
			y12 += results[name][15].to_i
			y14 += results[name][16].to_i

		end

		vh = vh * 3
		c2 = c2 * 3
		c3 = c3 * 3
		c4 = c4 * 3
		c9 = c9 * 3
		c12 = c12 * 3

		g2 = g2/15
		g3 = g3/15
		g4 = g4/15
		g12 = g12/35
		g14 = g14/35

		y2 = y2
		y3 = y3
		y4 = y4
		y12 = y12/2
		y14 = y14/2

		drawer = Drawer.new "results_Krassen_Angelov_A_14.svg", 37,470
		drawer.start
		drawer.cs
		
		drawer.text "Statistics", 250, 420, 58
		drawer.text "Time:#{end_time}" , 650 , 400 , 24
		
		drawer.text "VH", 15, -20, 20
		drawer.text "2", 55, -20, 20
		drawer.text "3", 95, -20, 20
		drawer.text "4", 135, -20, 20
		drawer.text "9", 175, -20, 20
		drawer.text "12", 215, -20, 20
		
		drawer.text "g2", 255, -20, 20
		drawer.text "g3", 295, -20, 20
		drawer.text "g4", 335, -20, 20
		drawer.text "g12", 375, -20, 20
		drawer.text "g14", 415, -20, 20
		
		drawer.text "y2", 458, -20, 20
		drawer.text "y3", 498, -20, 20
		drawer.text "y4", 538, -20, 20
		drawer.text "y12", 578, -20, 20
		drawer.text "y14", 618, -20, 20
		
		drawer.rect 30, vh, 15, "orange"
		drawer.rect 30, c2, 55, "yellow"
		drawer.rect 30, c3, 95, "orange"
		drawer.rect 30, c4, 135, "yellow"
		drawer.rect 30, c9, 175, "orange"
		drawer.rect 30, c12, 215, "yellow"
		
		drawer.rect 30, g2, 255, "orange"
		drawer.rect 30, g3, 295, "yellow"
		drawer.rect 30, g4, 335, "orange"
		drawer.rect 30, g12, 375, "yellow"
		drawer.rect 30, g14, 415, "orange"
		
		drawer.rect 30, y2, 458, "orange"
		drawer.rect 30, y3, 498, "yellow"
		drawer.rect 30, y4, 538, "orange"
		drawer.rect 30, y12, 578, "yellow"
		drawer.rect 30, y14, 618, "orange"
		
		# drawer.text "#{(vh/3).to_s}", 20, 20, 14
		# drawer.text "#{(c2/3).to_s}", 60, 20, 14
		# drawer.text "#{(c3/3).to_s}", 100, 20, 14
		# drawer.text "#{(c4/3).to_s}", 140, 20, 14
		# drawer.text "#{(c9/3).to_s}", 180, 20, 14
		# drawer.text "#{(c12/3).to_s}", 220, 20, 14

		# drawer.text "#{(g2*15).to_s}", 256, 20, 14
		# drawer.text "#{(g3*15).to_s}", 296, 20, 14
		# drawer.text "#{(g4*15).to_s}", 336, 20, 14
		# drawer.text "#{(g12*35).to_s}", 376, 20, 14
		# drawer.text "#{(g14*35).to_s}", 416, 20, 14

		# drawer.text "#{(y2).to_s}", 462, 20, 14
		# drawer.text "#{(y3).to_s}", 502, 20, 14
		# drawer.text "#{(y4).to_s}", 542, 20, 14
		# drawer.text "#{(y12*2).to_s}", 582, 20, 14
		# drawer.text "#{(y14).to_s}", 622, 20, 14

		drawer.finish

	end

end

