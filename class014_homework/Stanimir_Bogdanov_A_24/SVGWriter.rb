require 'nokogiri' # gem install nokogiri

class SVGWriter
	def write data

		valid_tasks = Array.new(10)
		valid_tasks[0] = 0
		valid_tasks[1] = 0
		valid_tasks[2] = 0
		valid_tasks[3] = 0
		valid_tasks[4] = 0
		valid_tasks[5] = 0

		data.each do |value, i|
			valid_tasks[0] += 1 if i[0].to_i == 2
			valid_tasks[1] += 1 if i[1].to_i == 2
			valid_tasks[2] += 1 if i[2].to_i == 2
			valid_tasks[3] += 1 if i[3].to_i == 2
			valid_tasks[4] += 1 if i[4].to_i == 2
			valid_tasks[5] += 1 if i[5].to_i == 2
		end

		b = Nokogiri::XML::Builder.new do |doc|
		  doc.svg xmlns:"http://www.w3.org/2000/svg", viewBox:"92 -150 200 200" do
		      doc.rect x:0, y:-valid_tasks[0], width:10, height: valid_tasks[0]
		      doc.rect x:15, y:-valid_tasks[1], width:10, height: valid_tasks[1]
		      doc.rect x:30, y:-valid_tasks[2], width:10, height: valid_tasks[2]
		      doc.rect x:45, y:-valid_tasks[3], width:10, height: valid_tasks[3]
		      doc.rect x:60, y:-valid_tasks[4], width:10, height: valid_tasks[4]
		      doc.rect x:75, y:-valid_tasks[5], width:10, height: valid_tasks[5]
		      	      #doc.text(x:80, y:0){"text"}
		  end
		end
		File.open("results_Stanimir_Bogdanov_A_24.svg", "w") do |file|
			file.puts b.to_xml
		end
	end
end
