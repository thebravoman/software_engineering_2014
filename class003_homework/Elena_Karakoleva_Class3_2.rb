student = Hash.new("");
dir = ARGV[0]

Dir.glob("#{dir}*/*") do |file| 

first_name = file.split(/\//).last.split(/_/).first	
last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first
task_number = file.split(/\//).last.split("_").last.split(".").first

student[first_name + " " + last_name] += task_number + ","


end

student.each do |key, num|
	sum = 0
	num.split(",").each do |x|
	sum += x.to_i
end
	puts key + "," + num + sum.to_s
end

