require 'rexml/document'

class SVGWriter
	def write p
		def initTable(parent)
			parent.puts("<text x=\"0\" y=\"9\" fill=\"white\">VH</text>")
			parent.puts("<text x=\"0\" y=\"20\" fill=\"white\">002</text>")
			parent.puts("<text x=\"0\" y=\"31\" fill=\"white\">003</text>")
			parent.puts("<text x=\"0\" y=\"42\" fill=\"white\">004</text>")
			parent.puts("<text x=\"0\" y=\"53\" fill=\"white\">009</text>")
			parent.puts("<text x=\"0\" y=\"64\" fill=\"white\">012</text>")
			parent.puts("<text x=\"0\" y=\"75\" fill=\"white\">014</text>")
			return parent
		end

		def rect(parent,q,e,h)
			r = parent.add_element "rect"
			r.attributes["x"] = q
			r.attributes["y"] = e
			r.attributes["width"] = h
			r.attributes["height"] = 11
			r.attributes["stroke"] = "red"
			r.attributes["stroke-width"] = "2"
			r.attributes["fill"] = "black"
		end
		doc = REXML::Document.new
		el_svg = doc.add_element "svg"
		el_svg.attributes["version"] = "1.1"
		el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
		q=0
		e=-11

		for i in 0..6 do
			e+=11
			rect(el_svg,q,e,p[i]+2)
		end
		svg = File.open("results_Martin_Grigorov_B_23.svg", "w")
		doc=(doc.to_s).split("</svg>").first
		svg.write(doc.to_s)
		svg=initTable(svg)
		svg.write("</svg>")
	end
end
