require "rexml/document"

class SVGWriter

	attr_writer :file_name
	attr_reader :file_name
	attr_accessor :x
	attr_accessor :y
	
	def initialize file_name="results_Ivelin_Slavchev_A_10.svg",x=200,y=200		
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
		line(1300,0,0,0)	
	end
	
	def finish	
		File.open(self.file_name, "w") do |f|
			f.write(@doc.to_s)
		end	
	end
	
	def write (results, end_time)	
		vh = 0; c2 = 0; c3 = 0; c4 = 0; c9 = 0; c12 = 0; c14 = 0; c15 = 0; c17_1 = 0; c17_2 = 0;
		g2 = 0; g3 = 0; g4 = 0; g12 = 0; g14 = 0; g15 = 0; g17_1 = 0; g17_2 = 0;
		y2 = 0; y3 = 0; y4 = 0; y12 = 0; y14 = 0; y15 = 0; y17_1 = 0; y17_2 = 0;		
		results.keys.each do |name|
			vh += results[name][0].to_i
			c2 += results[name][1].to_i
			c3 += results[name][2].to_i
			c4 += results[name][3].to_i
			c9 += results[name][4].to_i
			c12 += results[name][5].to_i
			c14 += results[name][6].to_i
			c15 += results[name][7].to_i
			c17_1 += results[name][8].to_i
			c17_2 += results[name][9].to_i			
			g2 += results[name][10].to_i
			g3 += results[name][11].to_i
			g4 += results[name][12].to_i
			g12 += results[name][13].to_i
			g14 += results[name][14].to_i
			g15 += results[name][15].to_i
			g17_1 += results[name][16].to_i
			g17_2 += results[name][17].to_i
			y2 += results[name][18].to_i
			y3 += results[name][19].to_i
			y4 += results[name][20].to_i
			y12 += results[name][21].to_i
			y14 += results[name][22].to_i
			y15 += results[name][23].to_i
			y17_1 += results[name][24].to_i
			y17_2 += results[name][25].to_i
		end
		
		vh = vh * 3
		c2 = c2 * 3
		c3 = c3 * 3
		c4 = c4 * 3
		c9 = c9 * 3
		c12 = c12 * 3
		c14 = c14 * 3
		c15 = c15 * 3
		c17_1 = c17_1 * 3
		c17_2 = c17_2 * 3
		g2 = g2/15
		g3 = g3/15
		g4 = g4/15
		g12 = g12/35
		g14 = g14/35
		g15 = g15/35
		g17_1 = g17_1/35
		g17_2 = g17_2/35
		y2 = y2
		y3 = y3
		y4 = y4
		y12 = y12/2
		y14 = y14/2
		y15 = y15/2
		y17_1 = y17_1/2
		y17_2 = y17_2/2
		drawer = SVGWriter.new "results_Ivelin_Slavchev_A_10.svg", 37,470
		drawer.start
		drawer.cs		
		drawer.text "Statistics", 250, 420, 58
		drawer.text "Time:#{end_time}" , 650 , 400 , 24		
		drawer.text "VH", 15, -20, 20
		drawer.text "2", 55, -20, 20
		drawer.text "3", 105, -20, 20
		drawer.text "4", 155, -20, 20
		drawer.text "9", 205, -20, 20
		drawer.text "12", 255, -20, 20
		drawer.text "14", 305, -20, 20
		drawer.text "15",355, -20, 20
		drawer.text "17_1", 405, -20, 20	
		drawer.text "17_2", 455, -20, 20	
		drawer.text "g2", 505, -20, 20
		drawer.text "g3", 555, -20, 20
		drawer.text "g4", 605, -20, 20
		drawer.text "g12", 655, -20, 20
		drawer.text "g14", 705, -20, 20	
		drawer.text "g15", 755, -20, 20	
		drawer.text "g17_1", 805, -20, 20	
		drawer.text "g17_2", 855, -20, 20	
		drawer.text "y2", 908, -20, 20
		drawer.text "y3", 958, -20, 20
		drawer.text "y4", 1008, -20, 20
		drawer.text "y12", 1058, -20, 20
		drawer.text "y14", 1108, -20, 20
		drawer.text "y15", 1158, -20, 20
		drawer.text "y17_1", 1208, -20, 20
		drawer.text "y17_2", 1258, -20, 20
		drawer.rect 30, vh, 15, "orange"
		drawer.rect 30, c2, 55, "yellow"
		drawer.rect 30, c3, 105, "orange"
		drawer.rect 30, c4, 155, "yellow"
		drawer.rect 30, c9, 205, "orange"
		drawer.rect 30, c12, 255, "yellow"
		drawer.rect 30, c14, 305, "orange"
		drawer.rect 30, c15, 355, "yellow"
		drawer.rect 30, c17_1, 405, "orange"
		drawer.rect 30, c17_2, 455, "yellow"
		drawer.rect 30, g2, 505, "orange"
		drawer.rect 30, g3, 555, "yellow"
		drawer.rect 30, g4, 605, "orange"
		drawer.rect 30, g12, 655, "yellow"
		drawer.rect 30, g14, 705, "orange"
		drawer.rect 30, g15, 755, "yellow"
		drawer.rect 30, g17_1, 805, "orange"
		drawer.rect 30, g17_2, 855, "yellow"
		drawer.rect 30, y2, 908, "orange"
		drawer.rect 30, y3, 958, "orange"
		drawer.rect 30, y4, 1008, "yellow"
		drawer.rect 30, y12, 1058, "orange"
		drawer.rect 30, y14, 1108, "yellow"
		drawer.rect 30, y15, 1158, "orange"
		drawer.rect 30, y17_1, 1208, "yellow"
		drawer.rect 30, y17_2, 1258, "orange"
		drawer.finish
	end

end

