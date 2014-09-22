Dir.glob("/home/kkk/Ruby/software_engineering_2014/vhodno_nivo/*/") do |full_info|

	person = Hash.new
	person['first_name'] = full_info.split('/').last.split('_').first
	person['second_name'] = full_info.split('/').last.split('_')[1]

	print "#{ person['first_name'] } #{ person['second_name'] },"

	m = 0	

	Dir.glob(full_info + "*.*") do |name_task|
		task = name_task.split('/').last.split('.').first.split('_').last.scan(/\d/).join('').to_i
		print "#{ task },"
		m+=task
	end
	
	print "#{ m }\n"

end
