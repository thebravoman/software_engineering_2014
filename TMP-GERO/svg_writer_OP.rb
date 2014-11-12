class SVGWriter
	def write (students_list, vhodno_nivo_res, homework2_res, homework3_res, homework4_res, mapping_res, homework12_res)
		array_count = 0
		
		#Mighty SVG file maker !
		File.open('svg_results.svg', 'w') {
			|file|
			file.write("<svg class=\"chart\" width=\"1920\" height=\"1080\">")
			file.write("<g transform=\"translate(0,0)\">")
			file.write("<rect width="" height="19"></rect>")
		}
		
		File.open('svg_results.svg', 'a') {
			|file|
			file << "</svg>"
		}
	end
end
