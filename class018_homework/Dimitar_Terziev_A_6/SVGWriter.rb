require 'nokogiri' # gem install nokogiri

class SVGWriter
	def write data, time_taken

		valid_tasks = Array.new(10)
		0.upto(TOTAL_HOMEWORKS) do |init_ind|
			valid_tasks[init_ind] = 0
		end

		data.each do |value, i|
			0.upto(TOTAL_HOMEWORKS){|checked_index|
				valid_tasks[checked_index] += 1 if i[checked_index].to_i == 2
			}
		end
		num_hws = 0;
		avr_flay = 0;
		flay_start = TOTAL_HOMEWORKS + 1
		flay_start.upto(flay_start + HOMEWORK_NUMBERS_FLOG_FLAY.size-1) do |flay_val|
		 	data.each do |student|
		 		num_hws+=1
		 		avr_flay += student[1][flay_val].gsub(/[^\d]/,"").to_f unless student[1][flay_val].is_a?(Numeric)
		 	end
		end 
		avr_flay/=num_hws
		avr_flog = 0
		num_hws = 0
		flog_start = flay_start + HOMEWORK_NUMBERS_FLOG_FLAY.size
		flog_start.upto((flog_start + HOMEWORK_NUMBERS_FLOG_FLAY.size)-1) do |flog_val|
			data.each do |student|
				num_hws+=1
		  		avr_flog += student[1][flog_val].string.gsub(/[^\d]/,"").to_f unless student[1][flog_val].is_a?(Numeric)
		 	end
		end
		avr_flog/=num_hws
		b = Nokogiri::XML::Builder.new do |doc|
		  doc.svg xmlns:"http://www.w3.org/2000/svg", viewBox:"0 -400 500 500", style:"background: #FFFFCC" do
		  	column_separation = 15
		  	doc.text_ "Results", x:175, y:-325, "font-size"=> 40
		  	doc.text_ "Time taken: #{time_taken}", x:-60, y:-385, "font-size"=> 10
		  	#doc.text_ "Average flay: #{avr_flay}", x:-60, y:-350, "font-size"=> 12
		  	#doc.text_ "Average flog: #{avr_flog}", x:-60, y:-325, "font-size"=> 12
		  	HOMEWORK_NAMES.each_with_index do |hw_name, column|
		  		percentage = (valid_tasks[column]/58.0)*100
		  		doc.rect x:(column*column_separation*5)-75,y:-valid_tasks[column]*5,width:50,height:valid_tasks[column]*5,stroke:"red"
				doc.text_ "#{percentage.round(2)}%", x:(column*75)-75, y:-(valid_tasks[column]*5)-20, "font-size"=> 15
				doc.text_ "(#{valid_tasks[column]}/58)", x:(column*75)-75, y:-(valid_tasks[column]*5)-3, "font-size"=> 15
				doc.text_ hw_name, x:(column*column_separation*5)-75, y:(column_separation-5), "font-size"=> 12
		  	end
		  end
		end
		File.open("results_Dimitar_Terziev_A_6.svg", "w") do |file|
			file.puts b.to_xml
		end
	end
end

#stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" />
#<stop offset="100%" style="stop-color:rgb(255,0,0);stop-opacity:1" />
#doc.linearGradient id:"fade_to_white", x1:"0%", y1:"0%", x2:"100%", x2:"0%", doc.stop( offset:"0%", "stop-color"=>"#75E3FF", "stop-opacity"=>1 ), doc.stop( offset:"100%", "stop-color"=>"#F1FCFF", "stop-opacity"=>1 )
