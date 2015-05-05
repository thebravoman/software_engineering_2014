student = Hash.new{|name, tasks| name[tasks] = Array.new}

Dir.glob("#{ARGV[0]}/*.*") do |fileName|
	firstName = fileName.split("/").last.split("_").first

	lastName = fileName.split("/").last.split("_", 2).last.split("_").first

	taskNum = fileName.split("_").last.split(".").first

		if taskNum.to_i.to_s == taskNum
			student[firstName.capitalize + " " + lastName.capitalize] << taskNum.to_i
		end
end

student.sort.each do |name, tasks|
	print "#{name},"
	sum = 0
	
	tasks.sort.each do |counter|
		print "#{counter},"
		sum += counter.to_i
	end 

	puts sum

end
