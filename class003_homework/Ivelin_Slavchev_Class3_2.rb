h = Hash.new(',')
path_files = ARGV[0]
Dir.glob("#{path_files}/*.*") do |file| 
	short = file.split('/').last.split('.').first
	first_name = short.split('_').first
	shortened_familial = short.split('_',2)
	last_name = shortened_familial.last.split('_').first
	tasks_done = short.split('_').last
	h[first_name + ' ' + last_name] = h[first_name + ' ' + last_name] + tasks_done + ','
end
h.each do |names, tasks|
	tasks_summary = 0
	tasks.split(',').each do |tasks_value|
		tasks_summary = tasks_summary + (tasks_value.to_i)
	end
puts [names + tasks + (tasks_summary.to_s)]
end
