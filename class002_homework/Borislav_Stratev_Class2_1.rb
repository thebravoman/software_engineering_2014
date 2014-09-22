storage_array = Array.new(19,0)
i = 0

Dir.glob("/home/ivostratev/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
	split = my_text_file.split(/_/).last.split(/\./).first.split(/([a-zA-z]+)/).last
	storage_array[i] = split
	i = i + 1
end

i = 1
while i < 20
	puts "#{i},#{storage_array.count("#{i}")}"
	i += 1
end
