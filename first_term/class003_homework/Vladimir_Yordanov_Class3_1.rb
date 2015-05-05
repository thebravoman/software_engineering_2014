homeworks = Array.new
i, counter = 0

#-- Writing the programs number in an array --
Dir.glob(ARGV[0]) do |my_text_file|  #custom path
	s = my_text_file.split(/_/)
	homeworks[i] = s.last.split(/\./).first
	i = i + 1
end 

for counter in 2..18
	if counter == 18 
		print "#{counter}"; puts
	else 
		print "#{counter}," 
	end
end 


for counter in 2..18 
	if counter == 18 
		print "#{homeworks.count("#{counter}")}" 
	else 
		print "#{homeworks.count("#{counter}")}," 
	end
end

