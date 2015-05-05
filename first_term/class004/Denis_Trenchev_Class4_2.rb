student = Hash.new{ |name, programs| name[programs] = []}

Dir.glob("#{ARGV[0]}/**/*.*") do |file|
	
	name = file.split("/").last.split("_").first
	last_name = file.split("/").last.split("_", 2).last.split("_").first
	number = file.split("_").last.split(".").first
	
	if 
		number.to_i.to_s == number 
	then 
		student[name.capitalize + " " + last_name.capitalize] << number.to_i 
	end
end

student.sort.each do |name, programs|
	
	sum = 0
	print "#{name},"
	programs.uniq.sort.each do |num|
    print num
    print ","
    sum += num
	
	end
  
  puts sum

end
