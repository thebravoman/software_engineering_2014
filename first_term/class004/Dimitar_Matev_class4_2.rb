	i = 0
	a = 0
	names = Array.new(120)
	people = Array.new(100)
	sortingArray = Array.new
	array = Hash.new
	name = ""
	current_task = ""
	old_name = ""
	tasks = ""
	sum = 0
Dir.glob("#{ARGV[0]}/*") do |my_text_file|
	#puts "#{my_text_file}..."
	short_name = my_text_file.split('/').last
	first_name = short_name.split('.').first.split('_').first
	last_name = short_name.split('.').first.split('_')[1]
	names[i] = "#{first_name} #{last_name}"
	namePart_2 = short_name.split('.').first.split('_', 3)[1]
	current_task = short_name.split('.').first.split('_').last

	if old_name != names[i] && first_name != nil && namePart_2!= nil && first_name.match(/^[[:alpha:]]+$/) && namePart_2.match(/^[[:alpha:]]+$/) && current_task.to_i > 1 && current_task.to_i < 20  then
		
		if sum != 0
			array[name] = "#{name}#{tasks},#{sum}"
			sortingArray[a] = "#{name}#{tasks},#{sum}"
			#people[a] = array[name]
			a += 1 
		end
		tasks = ""
		sum = 0
		short_name = my_text_file.split('/').last
		first_name = short_name.split('.').first.split('_').first
		current_task = short_name.split('.').first.split('_').last
		last_name = short_name.split('.').first.split('_')[1]
		name = "#{first_name} #{last_name}"
		i = i+1
		names[i] = "#{first_name} #{last_name}"
		
		old_name = "#{first_name} #{last_name}"
		tasks = tasks + "," + current_task
		sum += current_task.to_i
		
	elsif names[i] == old_name && first_name != nil && namePart_2!= nil && first_name.match(/^[[:alpha:]]+$/) && namePart_2.match(/^[[:alpha:]]+$/) && current_task.to_i > 1 && current_task.to_i < 20 
			current_task = short_name.split('.').first.split('_').last
			tasks = tasks + "," + current_task
			sum += current_task.to_i
		end
		
end 
array[name] = "#{name}#{tasks},#{sum}"
sortingArray[a] = "#{name}#{tasks},#{sum}"
#people = array.values.sort!
people = sortingArray.sort!
people.each do |x|
	puts x
end 

