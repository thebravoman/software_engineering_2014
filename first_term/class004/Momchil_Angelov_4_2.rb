all_students = Hash.new{|key, value| key[value] = []}
Dir.glob(ARGV[0]+"/**/*.*") do |my_text_file|
	ext = false
	my_text_file = my_text_file.split('/').last
	if my_text_file.include? '.'
		ext = true
	end
	my_text_file = my_text_file.split('.').first.split('_')
	name = my_text_file[0]
	last_name = my_text_file[1]
	task = my_text_file[2].to_i
	
	if !name ||  !last_name ||  !task || !ext
		next
	else
		name = name.capitalize
		last_name = last_name.capitalize
		all_students["#{name} #{last_name}"] << task
	end
end
all_students.sort.each do |key, value|
	sum = 0
	print "#{key}"
	value = value.uniq
	value.sort.each do |k|
		print ",#{k}"
		sum += k
	end
	print ",#{sum}"
	puts
end