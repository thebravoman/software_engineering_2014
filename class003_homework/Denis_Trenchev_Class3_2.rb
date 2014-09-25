hashche = Hash.new(',')

Dir.glob("#{ARGV[0]}/*/*.*") do |file| 
	
	short = file.split('/').last.split('.').first
	first_name = short.split('_').first
	shortened_familial = short.split('_',2)
	last_name = shortened_familial.last.split('_').first
	tasks_done = short.split('_').last
	hashche[first_name + ' ' + last_name] = hashche[first_name + ' ' + last_name] + tasks_done + ','

end

hashche.each do |names, tasks|
	
	tasks_summary = 0
	tasks.split(',').each do |tasks_value|
		tasks_summary = tasks_summary + (tasks_value.to_i)
	
	end

puts [names + tasks + (tasks_summary.to_s)]
end
