require 'rexml/document'

class SVGWriter
	def write p, end_time
		def initTable(parent)
			parent.puts("<text x=\"0\" y=\"9\" fill=\"white\">VH</text>")
			parent.puts("<text x=\"0\" y=\"20\" fill=\"white\">002</text>")
			parent.puts("<text x=\"0\" y=\"31\" fill=\"white\">003</text>")
			parent.puts("<text x=\"0\" y=\"42\" fill=\"white\">004</text>")
			parent.puts("<text x=\"0\" y=\"53\" fill=\"white\">009</text>")
			parent.puts("<text x=\"0\" y=\"64\" fill=\"white\">012</text>")
			parent.puts("<text x=\"0\" y=\"75\" fill=\"white\">014</text>")
			parent.puts("<text x=\"0\" y=\"86\" fill=\"white\">017/1</text>")
			parent.puts("<text x=\"0\" y=\"97\" fill=\"white\">017/2</text>")
			parent.puts("<text x=\"0\" y=\"108\" fill=\"white\">018</text>")
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

		for i in 0..9 do
			e+=11
			rect(el_svg,q,e,p[i]+2)
		end
		svg = File.open("results_Iosyf_Saleh_B_18.svg", "w")
		doc=(doc.to_s).split("</svg>").first
		svg.write(doc.to_s)
		svg=initTable(svg)
		svg.write("</svg>")
	end
end
