def is_it_on_time time_stamp,file
	`git log --until=#{time_stamp} #{file}`.empty?
end
