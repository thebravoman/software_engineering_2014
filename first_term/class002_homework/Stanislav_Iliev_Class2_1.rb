homework_array = Array.new(19,0)

Dir.glob("/home/gigo/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/).last.split(/\./).first
	task_count = s.to_i
	if task_count < homework_array.size
		homework_array[task_count] += 1
	end
end

for task_num in 2..homework_array.size - 1
	puts "Task #{task_num} - #{homework_array[task_num]}"
end
