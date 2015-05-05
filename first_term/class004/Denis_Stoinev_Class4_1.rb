arry = Array.new(19,0)
i = 0
c = 0

Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|

	s = my_text_file.split(/_/)
	i = s.last.split(/\./).first
	
	if i.length < 3 
	i = i.to_i
	
	else i = 20
	end

	if i > 1 and i < 19
		arry[i-1] += 1

	end
end	
	for c in 1..17
		if c > 16		 
		print "#{c+1}"
		else
		print "#{c+1},"  
		end
	end
print "\n"
	for c in 1..17
		if c > 16		 
		print "#{arry[c]}"
		else
		print "#{arry[c]},"  
		end
	end	
print "\n"
