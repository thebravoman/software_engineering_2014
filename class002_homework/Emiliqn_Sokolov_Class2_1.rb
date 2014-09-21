array1 = Array.new(19,0)
Dir.glob("/home/lorda97/Programs/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/).last.split(/\./).first
	k = s.to_i
	for i in 0..18
		if k == i+1
			array1[i]+=1
		end
	end
end

for i in 0..18
	puts "#{i+1}, #{array1[i]}"
end
