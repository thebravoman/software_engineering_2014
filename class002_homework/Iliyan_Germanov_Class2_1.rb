task_counter = Array.new(17,0) #creating an array with the exact number of tasks inited to 0
Dir.glob("/home/iliyan/Documents/software_engineering_2014/vhodno_nivo/**/*.*") do |path|
	s = path.split(/_/)
	task_number = s.last.split(/\./).first
	if task_number.length < 3 #checking if task_number is 1 or 2 digit number
		if task_number.to_i > 0 and task_number.to_i < 19 #checking for bad input
			task_counter[task_number.to_i - 2] += 1 #incrementing array el corresponding task's number - 2
		end
	end
end

for counter in 0..16 do
	puts "#{counter + 2},#{task_counter[counter]}" #printing task's number, number of times determined
end
