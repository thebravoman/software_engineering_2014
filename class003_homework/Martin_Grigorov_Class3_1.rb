a = Array.new(20,0)
k = 0
g = 0
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

while k <= 18 do
	k = k + 1
	if k == 19
		puts"#{k}"
	else
		print"#{k},"
	end
	
end

while g <= 18 do
	g = g + 1
	if g == 19
		puts"#{a[g]}"
	else
		print"#{a[g]}," 
	end
end
