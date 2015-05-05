hash = Hash.new("")

Dir.glob("/home/marian/Desktop/vhodno_nivo/*/*.*") do |file|

	splitted = file.split(/_/)
	firstName = splitted[1].split(/\//).last
	secondName = splitted[2]
	taskNumber = file.split(/_/).last.split(/\./).first
	hash[firstName + " " + secondName] += taskNumber + ","
end

hash.each do |name, tasks|
	sum = 0
	tasks.split(",").each do |x|
		sum += x.to_i
	end 
	puts "#{name},#{tasks}#{sum}" 
end