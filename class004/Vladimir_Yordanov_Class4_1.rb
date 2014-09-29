homeworks = Array.new
i = 0
counter = 2
#-- Writing the programs number in an array --
Dir.glob(ARGV[0] + "/**/*.*") do |my_text_file|  #custom path
	s = my_text_file.split(/_/)
	if s.last.split(//).last != '~'
		homeworks[i] = s.last.split(/\./).first
	end
	i+=1
end 

16.times { print "#{counter}," ; counter+=1 } 
print "18"; puts
counter = 2

16.times { print "#{homeworks.count("#{counter}")}," ; counter +=1 }
print  "#{homeworks.count("#{18}")}" 


