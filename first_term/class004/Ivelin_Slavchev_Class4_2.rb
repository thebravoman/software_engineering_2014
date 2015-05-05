h = Hash.new{|names, tasks| names[tasks] = Array.new}
path_files = ARGV[0]
Dir.glob("#{path_files}/**/*.*") do |file|
	file_type = file.split('.').last
	short = file.split('/').last.split('.').first
	first_name = short.split('_').first
	shortened_familial = short.split('_',2)
	last_name = shortened_familial.last.split('_').first
	tasks_done = short.split('_').last
	if first_name != ''
		if short.scan('_').count == 2
			if tasks_done.to_i > 1 and tasks_done.to_i < 19
				if ['rb','cpp','java','c','py','html'].include? file_type
					h[first_name.capitalize + ' ' + last_name.capitalize] << tasks_done.to_i
				end
			end
		end
	end
end
h.sort.each do |names, tasks|
	print "#{names},"
	tasks_summary = 0
	tasks.sort!.uniq.each do |tasks_value|
		print "#{tasks_value},"
		tasks_summary += tasks_value.to_i
	end
puts tasks_summary
end
