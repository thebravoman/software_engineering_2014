person = Hash.new{|name, tasks| name[tasks] = Array.new}
Dir.glob("#{ARGV[0]}/*.*") do |file|
	first_name = file.split("/").last.split("_").first
	last_name = file.split("/").last.split("_", 2).last.split("_").first
	task_number = file.split("_").last.split(".").first

	if task_number.to_i.to_s == task_number
		if task_number.to_i >= 2 && task_number.to_i <= 18
			if !first_name.empty? && !last_name.empty?
				person[first_name + " " + last_name] << task_number.to_i
			end
		end
	end
end
person.sort.each do |name, tasks|
print "#{name},"
sum = 0
tasks.sort.each do |i|
print "#{i},"
sum += i.to_i
end
puts sum
end
