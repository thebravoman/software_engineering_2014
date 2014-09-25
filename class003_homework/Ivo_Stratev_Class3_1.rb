i = 0
array = Array.new

Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
  
	split_first = my_text_file.split(/_/)
	split_second = split_first.last.split(/\./).first
	split_final = split_second.first.split(/([a-zA-z]+)/).last
	split_final.to_i
	array[i] = split_final
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
