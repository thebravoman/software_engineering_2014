a = Array.new(20,0)
k = 1
g = 1
ARGV.each do |argv|
	Dir.glob("#{argv}/**/*.*") do |my_text_file|
		#puts "working on: #{my_text_file}..."
		s = my_text_file.split(/_/)
		ex_num = s.last.split(/\./).first
		ex_num = ex_num.to_i
		if ex_num <= 19
			a[ex_num] = a[ex_num] + 1
		end
	
	end
end

while k <= 17 do
	k = k + 1
	if k == 18
		puts"#{k}"
	else
		print"#{k},"
	end
	
end

while g <= 17 do
	g = g + 1
	if g == 18
		puts"#{a[g]}"
	else
		print"#{a[g]}," 
	end
end
