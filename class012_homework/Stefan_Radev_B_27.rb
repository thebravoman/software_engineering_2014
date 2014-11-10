require 'csv' 

studentsVH = Array.new
students002 = Array.new
students003 = Array.new
students004 = Array.new
students009 = Array.new
students012 = Array.new
all_students = Array.new
resultsVH = Array.new
results002 = Array.new
results003 = Array.new
results004 = Array.new
results009 = Array.new
results012 = Array.new

def time(path, month, date, time)
	gitDates = Array.new
	gitLog = `git log #{path}`

	gitLog.split("\n").each do |line|
		if line.include?("Date: ")
			gitDates = line.split(" ")
		end
	end
	month2 = gitDates[2]
	date2 = gitDates[3].to_i
	time2 = gitDates[4].split(":").first.to_i
	
	if month2 != month then 
			return false 
	end
	if date2 > date then 
			return false 
	end
	if date2 == date && time2 >= time then 
			return false 
	end
	
	return true

end

Dir.glob("#{ARGV[0]}" +"/vhodno_nivo/*/") do |my_text_file|
	s = my_text_file.split('/').last
	count = 0
	Dir.glob("#{my_text_file}/*.*") do |file|
		name = file.split('/').last
		count = count +1
	end
	if count >= 3
		if s.split("_").length >= 2 && !s.split(".").last.include?("~")
			s = s.split("_")
			studentsVH << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
		end 
	end
end

Dir.glob("#{ARGV[0]}" +"/class002_homework/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last
	if s.split("_").length >= 2 && !s.split(".").last.include?("~")
		s = s.split("_")
		students002 << ["#{s[0]}", "#{s[1]}"]
		all_students << ["#{s[0]}", "#{s[1]}"]
	end
end
 
Dir.glob("#{ARGV[0]}" +"/class003_homework/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last
	if s.split("_").length >= 2 && !s.split(".").last.include?("~")
		s = s.split("_")
		students003 << ["#{s[0].capitalize}", "#{s[1].capitalize}"] 
		all_students << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
	end
end

Dir.glob("#{ARGV[0]}" +"/class004/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last
	if s.split("_").length >= 2 && !s.split(".").last.include?("~")
		s = s.split("_")
		students004 << ["#{s[0]}", "#{s[1]}"]
		all_students << ["#{s[0]}", "#{s[1]}"] 
	end
end

CSV.foreach("#{ARGV[0]}" +"/class009_homework/project_to_names.csv") do |csv|
	first = csv[1].split(" ")[0]
	last = csv[1].split(" ")[1]
	students009 << ["#{first}", "#{last}"] 
end

Dir.glob("#{ARGV[0]}" +"/class012_homework/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last.split("_")
	students012 << ["#{s[0]}", "#{s[1]}"] 
end
all_students.uniq!

all_students.each do |name|
	
	if studentsVH.include?(name) 
		path = ARGV[0]+"/vhodno_nivo/*"
		if time(path, "Sep", 17, 20)
			result = 2
			resultsVH << "#{result}"
		else
			result = 1
			resultsVH << "#{result}"
		end
	else
		result = 0
		resultsVH << "#{result}"
	end
end 

all_students.each do |name|
	if students002.include?(name)
		path = ARGV[0]+"/class002_homework/*"
		if time(path, "Sep", 22, 20) 
			result = 2
			results002 << "#{result}"
		else
			result = 1
			results002 << "#{result}"
		end
	else
		result = 0
		results002 << "#{result}"
	end
	
end

all_students.each do |name|
	if students003.include?(name) 
	path = ARGV[0]+"/class003_homework/*"
		if time(path, "Sep", 24, 20) 
			result = 2
			results003 << "#{result}"
		else
			result = 1
			results003 << "#{result}"
		end
	else
		result = 0
		results003 << "#{result}"
	end
	
end

all_students.each do |name|
	if students004.include?(name) 
		path = ARGV[0]+"/class004/*"
		if time(path, "Sep", 29, 20) 
			result = 2
			results004 << "#{result}"
		else
			result = 1
			results004 << "#{result}"
		end
	else
		result = 0
		results004 << "#{result}"
	end
	
end

all_students.each do |name|
	if students009.include?(name)
		path = ARGV[0]+"/class009_homework/*"
		if time(path, "Oct", 27, 20) 
			result = 2
			results009 << "#{result}"
		else
			result = 1
			results009 << "#{result}"
		end
	else
		result = 0
		results009 << "#{result}"
	end
	
end

all_students.each do |name|
	if students012.include?(name) 
		path = ARGV[0]+"/class012_homework/*"
		if time(path, "Nov", 10, 20) 
			result = 2
			results012 << "#{result}"
		else
			result = 1
			results012 << "#{result}"
		end
	else
		result = 0
		results012 << "#{result}"
	end

end
CSV.open("results_Stefan_Radev_B_27.csv", "w") do |csv|
	csv << [" ", " ", "VH", "002", "003", "004", "009", "012"]
	n = 0
	all_students.each do |first, last|
		csv << ["#{first}", "#{last}", "#{resultsVH[n]}",  "#{results002[n]}", "#{results003[n]}", "#{results004[n]}","#{results009[n]}", "#{results012[n]}"]
		n = n + 1
	end
end
