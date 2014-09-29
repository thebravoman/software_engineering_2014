array = Array.new(20,0)

Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|

	##puts "#{my_text_file}"
	
	s = my_text_file.split('_').last.split('.').first.to_i
	##puts s
	
	for i in 2..18
		if s == i
			array[i] += 1
		end
	end
end

for i in 2..18
	if	i < 18
		print "#{i},"
	else
		print "#{i}"
	end
end
puts ""
for i in 2..18
	if	i < 18
		print "#{array[i]},"
	else
		print "#{array[i]}"
	end
end
