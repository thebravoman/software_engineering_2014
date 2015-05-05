hash = Hash.new("");
b=ARGV[0]
Dir.glob("#{b}*/*.*")  do |my_text_file|
	first_name = my_text_file.split(/\//)
	taking_first_name=first_name.last.split(/_/).first
	last_name = my_text_file.split(/_/, 5)
	taking_last_name=last_name.last.split(/_/).first
	number = my_text_file.split(/_/)
	taking_number=number.last.split(/\./).first
	hash[taking_first_name.capitalize + " " + taking_last_name.capitalize] += taking_number + ","
end
hash.sort.each do |key, value|
	sum = 0
	can_be_printed = true
	value.split(",").each do |x|
		test_int = Integer(x) rescue nil
		if !test_int
			can_be_printed = false
		end
	end
	
	if can_be_printed
		print key 
		value.split(",").sort{|a, b| a.to_i <=> b.to_i}.each do |x|
			if x.to_i != 1 and x.to_i != 19
				sum += x.to_i
				print "," + x 
			end
		end
		puts "," + sum.to_s
	end
end
