class JSONWriter
	def write(results)	
		file = File.open("results_Vladimir_Yordanov_B_9.json","w")
		file.puts "{"
		
		$students.sort.to_a.each do |(k,v), index| 		
			file.print "\
\"#{k.split('_')[0]} #{k.split('_')[1]}\"\:\
{\"VH\":#{$students[k]['01']},\
\"002\":#{$students[k]['02']},\
\"003\":#{$students[k]['03']},\
\"004\":#{$students[k]['04']},\
\"009\":#{$students[k]['09']},\
\"012\":#{$students[k]['12']},\
\"g2\":#{$students[k]['g2']},\
\"g3\":#{$students[k]['g3']},\
\"g4\":#{$students[k]['g4']},\
\"g12\":#{$students[k]['g12']},\
\"g14\":#{$students[k]['g14']},\
\"y2\":#{$students[k]['y2']},\
\"y3\":#{$students[k]['y3']},\
\"y4\":#{$students[k]['y4']},\
\"y12\":#{$students[k]['y12']},\
\"y14\":#{$students[k]['y14']}}"


			file.print ","
			file.puts
		end
		
		file.print "}"
	end
end

$end
