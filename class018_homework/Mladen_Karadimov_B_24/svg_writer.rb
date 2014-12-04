=begin
!!!! CAUTION !!!!
!!!! BETA TESTING !!!!
class SVG #helping class
	@@colors = ["237, 28, 36", "255, 127, 3", "255, 242, 0", "181, 230, 29", "0, 162, 232", "163, 73, 164"]
	@@colorIndex = 0

	@@x = 50 #starting pos
	@@y = 350

	def self.getColor()
		tmp = @@colors[@@colorIndex]
		@@colorIndex += 1
		if @@colorIndex == 5
			@@colorIndex = 0
		end
		return "rgb(" + tmp + ")"
	end
	
	def self.writeText(string)
		str = string.to_s
		tmp = "<text x=\"#{@@x + 20}\" y=\"#{@@y + 20}\" fill=\"rbg(0, 0, 0)\">#{str}</text>"
		return tmp
	end
	
	def self.writeNumber(number)
		str = number.to_s
		tmp = "<text x=\"#{@@x + 20}\" y=\"#{@@y - number.to_i * 5 - 20}\" fill=\"rbg(0, 0, 0)\">#{str}</text>"
		return tmp
	end

	def self.writeRect(height)
		tmpHeight = height.to_i * 5
		color = self.getColor()
	  	tmp = "<rect x=\"#{@@x}\" y=\"#{@@y - tmpHeight}\" width=\"70\" height=\"#{tmpHeight}\" fill=\"#{color}\" />\n"
	  	@@x += 100
	  	return tmp
	end
end

class SVGWriter
	def write (hash)
		
		barChartData = Array.new(7,0)
		barChartText = ["VH", "002", "003", "004", "009", "012","014"]
		hash.each do |name, result|

			if name != nil
				result =  result.split(',')
				for i in 0..result.length - 1 do
					if result[i].to_i == 1 || result[i].to_i == 2 then
						barChartData[i] += 1
					end
				end				
			end
		end
	
		File.open("results_Valentin_Varbanov_B_4.svg", 'w') {
			|file|
			file << "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">\n"
			for i in 0..barChartData.length - 1 do
				file << SVG.writeText(barChartText[i])
				file << SVG.writeNumber(barChartData[i])
				file << SVG.writeRect(barChartData[i])
			end
			
			
			file << "</svg>"
			
		}
	end
end
=end
