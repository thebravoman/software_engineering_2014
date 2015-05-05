task_counter = Array.new(18,0)
def is_number(o)
    true if Integer(o) rescue false
end
def all_letters(str)
    str[/[a-zA-Z]+/]  == str
end
Dir.glob(ARGV[0] + "/**/*.*") do |path|
	target_file = path.split(/\//).last
	if target_file.count('_') == 2
		target_file = target_file.split(/_/)
		s = path.split(/_/)
		task_number = s.last.split(/\./).first
		if is_number(task_number) && all_letters(target_file[0]) && all_letters(target_file[1])
			if task_number.to_i > 1 and task_number.to_i < 19 
				task_counter[task_number.to_i - 2] += 1 
			end
		end
	end
end
for counter in 0..16 do
	print "#{counter + 2}"
	print "," if counter != 16
end
puts 
for counter in 0..16 do
	print "#{task_counter[counter]}"
	print "," if counter != 16
end
