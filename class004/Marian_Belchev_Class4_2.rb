hash = Hash.new{|name, tasks| name[tasks] = Array.new}

Dir.glob("#{ARGV[0]}/*.*") do |file|
	firstName = file.split("/").last.split("_").first
	lastName = file.split("/").last.split("_", 2).last.split("_").first
	taskNumber = file.split("_").last.split(".").first
	if taskNumber.to_i.to_s == taskNumber
		if taskNumber.to_i >= 2 && taskNumber.to_i <= 18
			if !firstName.empty? && !lastName.empty?
				hash[firstName.capitalize + " " + lastName.capitalize] << taskNumber.to_i
			end
		end
	end
end

hash.sort.each do |name, tasks|
	print "#{name},"
	sum = 0
	tasks.sort.each do |i|
		print "#{i},"
		sum += i.to_i
	end 
	puts sum
end
