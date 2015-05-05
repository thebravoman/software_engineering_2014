	i = 0
	names = Array.new(120)
	array = Hash.new
	name = ""
	current_task = ""
	old_name = ""
	tasks = ""
	sum = 0
Dir.glob("#{ARGV[0]}*/*") do |my_text_file|
	#puts "#{my_text_file}..."
	short_name = my_text_file.split('/').last
	first_name = short_name.split('.').first.split('_', 2).first

	if old_name != first_name then
		
		puts array[name] = "#{name}#{tasks},#{sum}"
		tasks = ""
		sum = 0
		short_name = my_text_file.split('/').last
		first_name = short_name.split('.').first.split('_', 2).first
		a = short_name.split('.').first.split('_').last
		last_name = short_name.split('.').first.split('_')[1]
		name = "#{first_name} #{last_name}"
		names[i] = first_name
		i = i+1
		old_name = first_name
		current_task = a
		tasks = tasks + "," + current_task
		sum += a.to_i
		
	elsif names[i] != old_name 
			a = short_name.split('.').first.split('_').last
			current_task = a
			tasks = tasks + "," + current_task
			sum += a.to_i
		end
		
end 
