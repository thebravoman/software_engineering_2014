require 'csv'
require 'shellwords'
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require_relative "csv_writer.rb"
results = Hash.new
time_starts = Time.now
def CreateStudent() 
	hash = Hash.new
	hash["VH"] = 0
	hash["homework_1"] = 0 
	hash["homework_2"] = 0
	hash["homework_3"] = 0
	hash["homework_4"] = 0
	hash["homework_5"] = 0 
	return hash
end

repository_path = ARGV.shift || "err"
homeworks = Hash.new
students = Hash.new 
homeworks["entry_homework"] = Dir.glob(repository_path + "/vhodno_nivo/**/*_*_*.*")
homeworks["homework_1"] = Dir.glob(repository_path + "/class002_homework/**/*_*_*_*.rb")
homeworks["homework_2"] = Dir.glob(repository_path + "/class003_homework/**/*_*_*_*.rb")
homeworks["homework_3"] = Dir.glob(repository_path + "/class004/**/*_*_*_*.rb")
homeworks["homework_4"] = Dir.glob(repository_path + "/class009_homework/**/*.pdf")
homeworks["homework_5"] = Dir.glob(repository_path + "/class012_homework/**/*_*_*_*.rb")

writer = 0 
ARGV.each do |element| 
	if element == "-o"
		case ARGV[ARGV.index("-o") + 1]
			when "xml"
				writer = XMLWriter.new
			when "svg"
				writer = SVGWriter.new
			when "csv"
				writer = CSVWriter.new
			when "html"
				writer = HTMLWriter.new
			when "json"
				writer = JSONWriter.new
			else 
				p "Cmon. OUTPUT EXTENSION. PLEASE"
				exit() 
		end
	end
end
if writer == 0 
	p "Cmon. OUTPUT EXTENSION. PLEASE"
	exit()
end	


results_count = Hash.new
homeworks["entry_homework"].each do |element|
	#if chktime returns -1 => late submission, 0 submission on time and some late commits, 1 all on time#
	student_name = element.split("/").last
	student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
	students[student_name] = CreateStudent()

	if results_count[student_name] == nil then results_count[student_name] = 0 end 
	
	result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} 2014:09:17:20:00 1`.to_i
	
	if result != -1 then results_count[student_name] += 1 end
end

results_count.each do |k,v| 
	if v >= 3 then students[k]["entry_homework"] = 2 
	else students[k]["entry_homework"] = 1 end
end

times = ["0","2014:09:22:20:00", "2014:09:24:20:00","2014:09:29:20:00","2014:10:27:20:00"]
for i in 1..5
	next if (i == 4)
	homeworks["homework_#{i.to_s}"].each do |element|
		student_name = element.split("/").last 	
		student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize

		if students[student_name] == nil then students[student_name] = CreateStudent() end			
		result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} #{times[i]} 1`.to_i 
	
		if result != -1 then students[student_name]["homework_#{i.to_s}"] = 2
		else students[student_name]["homework_#{i.to_s}"] = 1 end

	end
end



team_members = Hash.new 
team_members.compare_by_identity
CSV.foreach("#{repository_path}/class009_homework/project_to_names.csv") do |line|
	if line.length == 2 then
		team_members[line[0]] = line[1]
	end 
end



homeworks["homework_4"].each do |element| 

	team_name = element.split(/\//).last.split(/\./).first
	result = `ruby Stefan_Iliev_Class12_chktime.rb '#{element}' 2014:10:27:20:00 1`.to_i || 0 
	
	team_members.each do |k ,v|
		if k == team_name 
			student_name = v.split(" ")[0] + "_" + v.split(" ")[1] 
			if students[student_name] == nil then students[student_name] = CreateStudent() end

			if result != -1 then students[student_name]["homework_4"] = 2
			else students[student_name]["homework_4"] = 1 end 
		end 
	end
end 
=begin
homeworks["homework_5"].each do |element|
		student_name = element.split("/").last
		
			student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
			if students[student_name] == nil then students[student_name] = CreateStudent() end
			
			result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} 2014:11:10:20:00 1`.to_i 
			if result != -1 then students[student_name]["homework_5"] = 2
			else students[student_name]["homework_5"] = 1 end

	end
=end
students = students.sort_by{|k,v| k }
#students.each do | k , v | 
#	p k 
#	p v 
#	p "------------------"
#end 
puts Time.now - time_starts
writer.write(students)

	
