array1 = Array.new(19,0)

ARGV.each do |g|
	Dir.glob("#{g}/**/*.*") do |my_text_file|
		s = my_text_file.split(/_/).last.split(/\./).first
		k = s.to_i
		for i in 0..18
			if k == i+1
				array1[i]+=1
			end
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
for i in 1..17
	print "#{array1[i]}"
	if i != 17
		print ","
	end
end
