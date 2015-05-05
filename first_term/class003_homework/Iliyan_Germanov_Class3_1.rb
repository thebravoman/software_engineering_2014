task_counter = Array.new(17,0) 
Dir.glob(ARGV[0] + "**/*.*") do |path|
	s = path.split(/_/)
	task_number = s.last.split(/\./).first
	if task_number.length < 3 #checking if task_number is 1 or 2 digit number
		if task_number.to_i > 0 and task_number.to_i < 19 #checking for bad input
			task_counter[task_number.to_i - 2] += 1 
		end
	end
end
for counter in 0..16 do
	print "#{counter + 2}"
	print "," if counter != 16
end
print "\n"
for counter in 0..16 do
	print "#{task_counter[counter]}"
	print "," if counter != 16
end
printf "\n"
