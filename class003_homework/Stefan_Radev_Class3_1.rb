array=Array.new(19,0)

Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
	s=my_text_file.split(/_/).last.split(/\./).first.to_i

	if s >= 2 && s <= 18
		array[s-1] = array[s-1] + 1
	end

end

for i in 2..18
	if i == 18
		puts "#{i}"
	else
		print "#{i},"
	end
end

for i in 2..18
	if i == 18
		puts "#{array[i-1]}"
	else
		print "#{array[i-1]},"
	end
end
