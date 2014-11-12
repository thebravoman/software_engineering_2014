require 'rexml/document'

class SVGWriter
	def write p
		def rect(parent,q,e,h)
			r = parent.add_element "rect"
			r.attributes["x"] = q
			r.attributes["y"] = e
			r.attributes["width"] = h
			r.attributes["height"] = 10
			r.attributes["stroke"] = "red"
			r.attributes["stroke-width"] = "2"
			r.attributes["fill"] = "black"
		end
		doc = REXML::Document.new
		el_svg = doc.add_element "svg"
		el_svg.attributes["version"] = "1.1"
		el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
		w=0
		e=-9
		p[0]=348-p[1]-p[2]
		2.downto(0) do |i|
			e+=10
			rect(el_svg,w,e,p[i]+2)
		end
		File.open("results_Iosyf_Saleh_B_18.svg", "w") do |f|
			f.write(doc.to_s)
		end
	end
end
