person = Hash.new("")

Dir.glob("#{ARGV[0]}*/*.*") do |file_1|

	splitted = file_1.split("_")
	first_Name = splitted[1].split("\/").last
	second_Name = splitted[2]
	taskNumber = file_1.split("_").last.split("\.").first
	person[first_Name + " " + second_Name] += taskNumber + ","

end
	
	person.each do |name, tasks|
		sum = 0
		print "#{name}" + ","
		tasks.split(",").each do |y|
		sum += y.to_i	

end
	puts program + sum.to_s
end
