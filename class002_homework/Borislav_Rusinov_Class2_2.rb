
hash = Hash.new("");
Dir.glob("/home/kingsize/software_engineering_2014/vhodno_nivo/*/*") do |my_text_file|

	first_name = my_text_file.split(/\//)
	p=first_name.last.split(/_/).first 

	last_name = my_text_file.split(/_/, 5)
	a=last_name.last.split(/_/).first 

	number = my_text_file.split(/_/)
	j=number.last.split(/\./).first

	hash[p + " " + a] += j + ","

end

hash.each do  |key, value|
	sum = 0
	value.split(",").each do |x|
		sum += x.to_i
	end
	puts key + "," + value + sum.to_s
end 
