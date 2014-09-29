array1 = Array.new(17,0)

ARGV.each do |g|
	Dir.glob("#{g}/**/*.*") do |my_text_file|
		s = my_text_file.split(/_/).last.split(/\./).first
		k = s.to_i
		if (k > 1) && (k <= 18)
			array1[k-2]+=1
		end
	end
end
for i in 1..17
	print "#{i+1}"
	if i != 17
		print ","
	end
end
puts
for i in 0..16
	print "#{array1[i]}"
	if i != 16
		print ","
	end
end
