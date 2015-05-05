a = Array.new(20,0)
k = 0
Dir.glob("/home/martin/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
	#puts "working on: #{my_text_file}..."
	s = my_text_file.split(/_/)
	ex_num = s.last.split(/\./).first
	ex_num = ex_num.to_i
	if ex_num <= 19
		a[ex_num] = a[ex_num] + 1
	end
	
end

while k < 19 do
	k = k + 1
	puts"#{k}, #{a[k]}"
end
