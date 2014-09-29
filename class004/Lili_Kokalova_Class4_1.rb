arr = Array.new
i=0
Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/)
	s = s.last.split(/\./).first.to_i
	arr[i] = s
	i += 1
end

for j in 2..18
	print "#{j}"	
	if j != 18 
		print ","
	end
end
puts

for i in 2..18 
	print "#{arr.count(i)}"
	if i != 18
		print","
	end
end
