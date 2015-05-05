class SVGWriter
	def bar(text, x, y, w, val, bH, height, margin, color)
		text.puts "\t<rect x='#{x}' y='#{y}' width='#{w}' height='#{bH}' style='fill:#{color};stroke-width:1;stroke:rgb(0,0,0)'/>"
		if val>30
            text.puts "<text x='#{x + w/2}' y='#{height-margin-bH/2+10}' fill='white' font-size='13' text-anchor='middle'>#{val}</text>"
        else
        	text.puts "<text x='#{x + w/2}' y='#{height-margin-bH-5}' fill='black' font-size='13' text-anchor='middle'>#{val}</text>"
        end
		return text
	end

	def write(results, header, time)
		file = File.open("results_Hristiyan_Dodov_B_29.svg", "w")
		
		$flogSI = 0; $flaySI = 0
		for i in 0..header.length-1
			if $flogSI == 0
				str = header[i][/g/]
				if str != nil; $flogSI = i; end
			end
			if $flaySI == 0
				str = header[i][/y/]
				if str != nil; $flaySI = i; end
			end
		end

		width = 1100; height = 450; margin = 40
		valueStep = (width - margin*2)/(header.length)
		
		file.puts "\
<svg width='#{width}' height='#{height}' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
	<rect x='0' y='0' width='100%' height='100%' style='fill:rgb(255,255,255);'/>
	<text x='#{width/2}' y='#{margin*2}' fill='black' text-anchor='middle' font-size='30'>Homeworks overview</text>
	<text x='#{width/2}' y='#{margin*2+20}' fill='black' text-anchor='middle'>execution time : #{time/60}min #{time%60}sec</text>
	<line x1='#{margin}' y1='#{height-margin+1}' x2='#{width-margin}' y2='#{height-margin+1}' style='stroke:rgb(0,0,0);stroke-width:2'/>
	<rect x='#{margin}' y='#{margin}' width='10px' height='10px' style='fill:rgb(150,0,0);'/>
	<text x='#{margin+20}' y='#{margin+8}' fill='black' font-size='13'>number of 2s</text>
	<rect x='#{margin}' y='#{margin+25}' width='10px' height='10px' style='fill:rgb(66,0,66);'/>
	<text x='#{margin+20}' y='#{margin+33}' fill='black' font-size='13'>average flog</text>
	<rect x='#{margin}' y='#{margin+50}' width='10px' height='10px' style='fill:rgb(19,47,163);'/>
	<text x='#{margin+20}' y='#{margin+58}' fill='black' font-size='13'>average flay</text>"
		  
		for i in 0..header.length-1 do
			file.puts "\t<text x='#{margin + valueStep/2 + valueStep*i}' y='#{height-margin+20}' fill='black' text-anchor='middle' font-size='11'>#{header[i]}</text>"
		end
		
		values = Array.new
		for i in 0..header.length-1; values[i] = 0; end
		
		results.each do |k,v|
			for i in 0..v.length-1
				if i >= $flogSI 
					values[i] += v[i]
					values[i] /= 2
				elsif v[i] == 2
					values[i] += 1
				end
			end
		end
		
		for i in 0..header.length-1
			barHeight = height-margin*2-90
			if values[i]<barHeight; barHeight = values[i]; end
			
			color = "rgb(150,0,0)"
			if i<$flogSI; color="rgb(150,0,0)"
			elsif i<$flaySI; color="rgb(66,0,66)"
			else; color="rgb(19,47,163)"
			end
			
			bar(file, margin+valueStep*i, (height-margin)-barHeight,
				valueStep, values[i], barHeight, height, margin, color)
		end

		file.puts "\
</svg>"

	end
end
