hash = Hash.new("")

Dir.glob("home/moretti/software_engineering_2014/vhodno_nivo/*") do |file|
	splitted = file.split("/").last
	firstName = splitted.split("_").first
	secondName = splitted.split("_", 2).last.split("_").first
	taskNumber = file.split("_").last.split(".").first
	hash[firstName + " " + secondName] += taskNumber + ","
end

hash.each do |name, tasks|
	sum = 0
	tasks.split(",").each do |x|
		sum += x.to_i
	end 
	puts "#{name},#{tasks}#{sum}" 
end