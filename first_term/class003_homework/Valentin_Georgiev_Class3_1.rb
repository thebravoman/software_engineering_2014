ary = Array.new(20, 0)

Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|

	s = my_text_file.split(/_/)
	s = s.last.split(/\./).first
	s = s.to_i

	begin
 		ary[s] +=1
	end while s < 1 && s > 19

end

for i in 2..18 do
	print "#{i}"
	if i != 18
		print ","
	end
end

puts ""

for i in 2..18 do
	print "#{ary[i]}"
	if i != 18
		print ","
	end
end
