hash = Hash.new
sum = 0
all_tasks = ""

Dir.glob("#{ARGV[0]}/*") do |my_folder|
	#puts "#{my_folder}"
	name_folder_user = my_folder.split('/')[-1]
	name = "#{name_folder_user.split('_')[0]} #{name_folder_user.split('_')[1]}" 
#	puts name
	Dir.glob("#{ARGV[0]}/#{name_folder_user}/*.*") do |my_text_file|
#		puts "#{my_text_file}"
		tasks = my_text_file.split('/')[-1]
		number_task = tasks.split('.')[0].split("_")[-1]
		all_tasks = all_tasks + "," + number_task
		sum = sum + number_task.to_i
	end
#	puts all_tasks
	hash[name] = "#{name}#{all_tasks},#{sum}" 
	puts hash[name]
#	puts sum
	sum = 0
	all_tasks = ""
end

