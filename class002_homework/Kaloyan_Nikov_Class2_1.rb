storage_array = Array.new(19) {|i| i = 0}
Dir.glob(
	"/home/dragonkoko/Repository/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
	s = my_text_file.split(/_/)
	work_num = s.last.split(/\./).first
	m = work_num.to_i
	storage_array[m] += 1 if m != nil and m <19
end
i = 2
while i < 19
	puts "#{i},#{storage_array[i]}"
	i += 1
end
