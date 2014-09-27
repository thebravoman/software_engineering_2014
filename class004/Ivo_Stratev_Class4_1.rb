i = 0
array = Array.new

Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/).last.split(/\./).first
	array[i] = s
	i = i + 1
end

for i in 0..19
	if i > 1 && i < 19
		if (i == 18)
			puts "#{i}"
		else
			print "#{i},"
		end
	end
end

for i in 0..19
	if i > 1 && i < 19
		if i == 18
			print "#{array.count("#{i}")}"
		else
			print "#{array.count("#{i}")},"
		end
	end
end
