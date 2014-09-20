homeworks = Array.new
i = 0
counter = 0

#-- Writing the programs number in an array --
Dir.glob("/path/**/*.*") do |my_text_file| 

#splitting names by "_" and "." 
	s = my_text_file.split(/_/)
	homeworks[i] = s.last.split(/\./).first
	i = i + 1
end #end Dir.glob

#printing the results
for counter in 1..19
	puts "Task #{counter}: #{homeworks.count("#{counter}")}"
end #for count
