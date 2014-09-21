storage_array = Array.new(19) {|i| i = 0} #Making an array to store our integers
Dir.glob(
	"/home/dragonkoko/Repository/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/)
	work_num = s.last.split(/\./).first
	m = work_num.to_i #converting to string
	storage_array[m] += 1 if m != nil and m <19 #here we count and check for misstyped homeworks
end
i = 2
while i < 19 
	puts "#{i},#{storage_array[i]}" #printing the results
	i += 1
end
