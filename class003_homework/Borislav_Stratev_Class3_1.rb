storage_array = Array.new(19,0)
i = 0

Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
split = my_text_file.split(/_/).last.split(/\./).first.split(/([a-zA-z]+)/).last
storage_array[i] = split
i = i + 1

end

for i in 2..18
	print "#{i}"
	if i != 18	
		print ","
	end
end

print"\n"
i = 2

while i < 19
	print "#{storage_array.count("#{i}")}"
	i += 1
	print "," if i != 19	
end
