require 'csv'
require 'shellwords'
results = Hash.new

def CreateStudent() 
	hash = Hash.new
	hash["entry_homework"] = 0
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
homeworks["entry_homework"] = Dir.glob(repository_path + "/vhodno_nivo/**/*.*")
homeworks["homework_1"] = Dir.glob(repository_path + "/class002_homework/**/*.*")
homeworks["homework_2"] = Dir.glob(repository_path + "/class003_homework/**/*.*")
homeworks["homework_3"] = Dir.glob(repository_path + "/class004/**/*.*")
homeworks["homework_4"] = Dir.glob(repository_path + "/class009_homework/**/*.*")
homeworks["homework_5"] = Dir.glob(repository_path + "/class012_homework/**/*.*")




results_count = Hash.new
homeworks["entry_homework"].each do |element|
	#if chktime returns -1 => late submission, 0 submission on time and some late commits, 1 all on time#
	student_name = element.split("/").last
	if student_name.split("_").length >= 2 && !student_name.split(".").last.include?("~") && !(student_name.split(".").last == "class")
		student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
		students[student_name] = CreateStudent()
		if results_count[student_name] == nil then results_count[student_name] = 0 end 
		
		result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} 2014:09:17:20:00 1`.to_i
		if result != -1 then results_count[student_name] += 1 end
	end
end

results_count.each do |k,v| 
	if v >= 3 then students[k]["entry_homework"] = 2 
	else students[k]["entry_homework"] = 1 end
end

times = ["0","2014:09:22:20:00", "2014:09:24:20:00","2014:09:29:20:00"]
for i in 1..3
	homeworks["homework_#{i.to_s}"].each do |element|
		student_name = element.split("/").last
		if student_name.split("_").length == 4 then 
		
			student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
			if students[student_name] == nil then students[student_name] = CreateStudent() end
			
			result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} #{times[i]} 1`.to_i 
			if result != -1 then students[student_name]["homework_#{i.to_s}"] = 2
			else students[student_name]["homework_#{i.to_s}"] = 1 end

		end
	end
end


team_members = Hash.new 
team_members.compare_by_identity
CSV.foreach("../class009_homework/project_to_names.csv") do |line|
	if line.length == 2 then
		team_members[line[0]] = line[1]
	end 
end



homeworks["homework_4"].each do |element| 
	if element.split(/\//).last.split(/\./).last != "pdf" then next end 
	if element.include?(" ") then next end 

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

homeworks["homework_5"].each do |element|
		student_name = element.split("/").last
		if student_name.split("_").length == 4 then 
		
			student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
			if students[student_name] == nil then students[student_name] = CreateStudent() end
			
			result = `ruby Stefan_Iliev_Class12_chktime.rb #{element} 2014:11:10:20:00 1`.to_i 
			if result != -1 then students[student_name]["homework_5"] = 2
			else students[student_name]["homework_5"] = 1 end

		end
	end
students = students.sort_by{|k,v| k }
#students.each do | k , v | 
#	p k 
#	p v 
#	p "------------------"
#end 
CSV.open("results_Stefan_Iliev_B_28.csv","w") do |csv|
	csv << ["First","Last","VH","002","003","004","009","012"]
	students.each do |name , hw_hash| 
		csv << [name.split("_").first,name.split("_").last,hw_hash.values_at("entry_homework").first.to_i,hw_hash.values_at("homework_1").first.to_i,
				hw_hash.values_at("homework_2").first.to_i,hw_hash.values_at("homework_3").first.to_i,hw_hash.values_at("homework_4").first.to_i,hw_hash.values_at("homework_5").first.to_i
				]
	end 
end 

