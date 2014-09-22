	i = 0
	names = Array.new(120)
	array = Hash.new
	name = ""
	current_task = ""
	old_name = ""
	tasks = ""
	sum = 0
Dir.glob("/home/dimmat/Documents/software_engineering_2014/vhodno_nivo/*/*") do |my_text_file|
	#puts "#{my_text_file}..."
	short_name = my_text_file.split('/').last
	first_name = short_name.split('.').first.split('_', 2).first

	if old_name != first_name then
		
		puts array[name] = "#{name}#{tasks},#{sum}"
		sum = 0
		short_name = my_text_file.split('/').last
		first_name = short_name.split('.').first.split('_', 2).first
		a = short_name.split('.').first.split('_', 2).last
		last_name = a.split('_', 2).first
		name = "#{first_name} #{last_name}"
		names[i] = first_name
		i = i+1
		old_name = first_name
		current_task = a.split('_', 2).last
		tasks = tasks + "," + current_task
		sum += a.split('_', 2).last.to_i
		
	elsif names[i] != old_name 
			tasks = tasks + "," + current_task
			sum += a.split('_', 2).last.to_i
		end
		
end 
