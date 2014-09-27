student = Hash.new{|hash, key| hash[key] = []}
dir = ARGV[0]

def wordcount(file_split)
    file_split.split("_").length
end

Dir.glob("#{dir}/**/*.*") do |file| 

	first_name = file.split(/\//).last.split(/_/).first.capitalize	
	last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first.capitalize
	task_number = file.split(/\//).last.split("_").last.split(".").first
	file_split = file.split(/\//).last

	p = wordcount(file_split)
	if p == 3 
		if (task_number.to_i >1) &&(task_number.to_i < 19)	
			student["#{first_name} #{last_name}"] << task_number.to_i
		end
	end
end
student.sort.each do |key,values|
	print "#{key}"
	sum = 0 
		values.sort!.each do |x|
			print ",#{x}"
			sum += x
		end
	puts ",#{sum}"
end
