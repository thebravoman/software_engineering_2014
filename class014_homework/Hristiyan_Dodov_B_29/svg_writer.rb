class SVGWriter
	def bar(text, x, y, w, h)
		text.puts("\t<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}' style='fill:rgb(150,0,0);stroke-width:1;stroke:rgb(0,0,0)'/>
            <text x='#{x + w/2 - 4}' y='340' fill='white'>#{h}</text>")
		return text
	end

	def write(results)
		file = File.open("results_Hristiyan_Dodov_B_29.svg", "w")
		
		textStart = 80; textStep = 75
		barStart = 50; barStep = 75
		
		file.puts "\
<svg width='600' height='400' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
	<line x1='50' y1='350' x2='550' y2='350' style='stroke:rgb(0,0,0);stroke-width:2'/>
	<line x1='50' y1='350' x2='50' y2='50' style='stroke:rgb(0,0,0);stroke-width:2' />
	<text x='#{textStart}' y='365' fill='black'>VH</text>
	<text x='#{textStart + textStep}' y='365' fill='black'>002</text>
	<text x='#{textStart + textStep*2}' y='365' fill='black'>003</text>
	<text x='#{textStart + textStep*3}' y='365' fill='black'>004</text>
	<text x='#{textStart + textStep*4}' y='365' fill='black'>009</text>
	<text x='#{textStart + textStep*5}' y='365' fill='black'>012</text>"
		
		values = Array.new
		for i in 0..5; values[i] = 0; end
		
		results.each do |k,v|
			for i in 0..5
				if v[i] == 2
					values[i] += 1
				end
			end
		end
		
		for i in 0..5
            puts values[i]
			bar(file, barStart + barStep*i, 350 - values[i], barStep, values[i])
		end
		
		file.puts "\
</svg>"
	end
end
