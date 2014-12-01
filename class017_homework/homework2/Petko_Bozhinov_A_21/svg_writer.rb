require 'rexml/document'

class SVGDrawer

	attr_writer :file_name
	attr_reader :file_name
	attr_accessor :x, :y

	def initialize
		@riser = 0
		@result_points = Array.new(9,0)
	end

	def create a_file_name, x = 200, y = 200
		self.file_name = a_file_name
		self.x = x
		self.y = y
	end

	def start
		@doc = REXML::Document.new
		@el_svg = @doc.add_element "svg"
		@el_svg.attributes["version"] = "1.1"
		@el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	end

	def finalize
		File.open("#{file_name}", "w") do |f|
			f.write(@doc.to_s)
		end
	end

	def check_ones grades, key, index, result_to_sv
		if grades["#{key}"][index] == 1
			result_to_sv[index] += 1
		end
	end

	def text value, x, y
		t = @el_svg.add_element "text"
		t.attributes["x"] = x
		t.attributes["y"] = y
		t.attributes["fill"] = "black"
		t.text = value
	end

	def rect(parent, w, h, x, y, red_f = 0, green_f = 0, blue_f = 0)
		r = parent.add_element "rect"
		r.attributes["width"] = w
		r.attributes["height"] = h
		r.attributes["x"] = x
		r.attributes["y"] = y
		r.attributes["stroke"] = "none"
		r.attributes["stroke-width"] = "1"
		r.attributes["fill"] = "rgb(#{red_f},#{green_f},#{blue_f})"
	end

	def draw_svg result_sv, index
		rect(@el_svg, result_sv*100, 5*10, 120, 60*(index+1), ((index+1)*6)*5, 0, 0)
	end

	def put_text starting_point
		for z in 0..8
			if z == 0 then string = "Entry level: "
				elsif z == 1 then string = "Task 2: "
				elsif z == 2 then string = "Task 3: "
				elsif z == 3 then string = "Task 4: "
				elsif z == 4 then string = "Task 9: "
				elsif z == 5 then string = "Task 12: "
				elsif z == 6 then string = "Task 14: "
				elsif z == 7 then string = "Task 17.1: "
				elsif z == 8 then string = "Task 17.2: "
			end
			text("#{string}", 10, starting_point)
			starting_point += 60
		end
	end

	def write grades, time
		grades.keys.each do |key|
			for z in 0..8
				check_ones grades, key, z, @result_points
			end
		end
		create "results_Petko_Bozhinov_A_21.svg", 1000, 1000
		start
			for z in 0..8
				draw_svg @result_points[z].to_i, z
			end
			put_text 90
		finalize
	end

end