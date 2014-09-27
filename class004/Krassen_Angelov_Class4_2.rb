hash = Hash.new{|hash, key| hash[key] = Array.new}
#sum = 0  # old version
#all_tasks = "" # old version

Dir.glob("#{ARGV[0]}/*") do |my_folder|
	#puts "#{my_folder}"
	name_folder_user = my_folder.split('/')[-1]
	name = "#{name_folder_user.split('_')[0]} #{name_folder_user.split('_')[1]}" 
	#puts name
	Dir.glob("#{ARGV[0]}/#{name_folder_user}/*.*") do |my_text_file|
		#puts "#{my_text_file}"
		tasks = my_text_file.split('/')[-1]
		number_task = tasks.split('.')[0].split("_")[-1]
		#all_tasks = all_tasks + ","+ number_task # old version
		if name_folder_user.split('_').length == 3 
			if number_task.to_i > 1 && number_task.to_i < 19
				hash[name].push number_task.to_i
			end
		end
	end
# old version
=begin 
	#puts all_tasks
	hash[name] = "#{name}#{all_tasks},#{sum}" 
	puts hash[name] 
	#puts sum
	sum = 0
	all_tasks = ""
=end
end

for key, value in hash.sort do
	print "#{key},"
	sum = 0
	for task in value.sort do 
		print "#{task},"
		sum += task
	end
	puts "#{sum}"
end
