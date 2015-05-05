student = Hash.new {|hash, key| hash[key] = []}
Dir.glob("/home/ivo/Desktop/Programming/Tech11/software_engineering_2014/vhodno_nivo/*.*") do |my_text_file, pair|
	short_name = my_text_file.split("/").last.split(".").first.split("_")
	student["#{short_name[0]} #{short_name[1]}"] << short_name[2].to_i if short_name[2] and Integer(short_name[2])
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