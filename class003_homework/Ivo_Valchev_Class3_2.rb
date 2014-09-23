student = Hash.new {|hash, key| hash[key] = []}
Dir.glob(ARGV[0] + "*.*") do |my_text_file, pair|
	short_name = my_text_file.split("/").last.split(".").first.split("_")
	valid_number = Integer(short_name[2]) rescue nil
	student["#{short_name[0]} #{short_name[1]}"] << short_name[2].to_i if short_name[2] and 
		valid_number != nil and valid_number > 1 and valid_number < 19
end

student.each_pair do |key, value| 
	print "#{key}"
	value = value.sort
	s=0
	value.each do |element|	
		print ",#{element}"
		s+=element
	end
	puts ",#{s}"
end