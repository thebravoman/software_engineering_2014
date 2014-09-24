homework_array = Array.new(19,0)

ARGV.each do |dir|
	Dir.glob("#{dir}/**/*.*") do |my_text_file|
		s = my_text_file.split(/_/).last.split(/\./).first
		task_count = s.to_i
		if task_count < homework_array.size
			homework_array[task_count] += 1
		end
	end
end

for task_num in 2..homework_array.size - 1
	print "#{task_num}"
	if task_num <= 18
		print ","
	end
	if task_num == 18
		puts
	end
end

for task_num in 2..homework_array.size - 1
	print "#{homework_array[task_num]}"
	if task_num <= 18
		print ","
	end
end
