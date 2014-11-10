require 'csv'

#Variables
file_count = 0
array_count = 0
folder = 0
path = "SWAG"

students_list = Array.new()
vhodno_nivo = Array.new()
vhodno_nivo_res = Array.new()
vhodno_nivo_full = Array.new()
homework2 = Array.new()
homework2_res = Array.new()
homework3 = Array.new()
homework3_res = Array.new()
homework4 = Array.new()
homework4_res = Array.new()
homework12 = Array.new()
homework12_res = Array.new()

#Funtions
def onTime(targetPath, dead_month, dead_date, dead_time)
	logLines = Array.new
	log = `git log #{targetPath}`

	log.split("\n").each do |line|
		if line.include?("Date: ")
			logLines = line.split(" ")
		end
	end

	month = logLines[2]
	date = logLines[3].to_i
	time = logLines[4].split(":").first.to_i
	
	if month != dead_month then return false end
	if date > dead_date then return false end
	if date == dead_date && time >= dead_time then return false end
	
	return true
end	

Dir.glob(ARGV[0]+"/class004/**").each do |file|
	if file.split('/').last != nil
		s = file.split('/').last
		s1 = s.split('_')[0] + "_" + s.split('_')[1]
		students_list[array_count] = s1
		array_count += 1
	end
end

students_list.sort!
array_count = 0
folders = 0

#Vhodno Nivo
Dir.glob(ARGV[0]+"/vhodno_nivo/**/").each do |folder|
	if File.directory?(folder)
		Dir.glob(folder+"/*.*").each do |name|
			file_count += 1
		end
		if file_count >= 3
			folder = folder.split('/').last.split('_')
			vhodno_nivo[array_count] = folder[0].to_s + "_" + folder[1].to_s
			array_count += 1
			folders += 1
		end
		file_count = 0
	end
end

vhodno_nivo.sort!
array_count = 0

while array_count <= students_list.length
	if vhodno_nivo.include?(students_list[array_count]) == true
		path = ARGV[0]+"/vhodno_nivo/"+students_list[array_count]+"*"
		if onTime(path, "Sep", 17, 20)
			vhodno_nivo_res[array_count] = 2
		else
			vhodno_nivo_res[array_count] = 1
		end
	else
		vhodno_nivo_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#Homework 2
Dir.glob(ARGV[0]+"/class002_homework/*.rb").each do |file|
	s = file.split('/').last
	s = s.split('_')[0] + "_" + s.split('_')[1]
	homework2[array_count] = s
	array_count += 1
end

homework2.sort!
array_count = 0

while array_count <= students_list.length
	if homework2.include?(students_list[array_count]) == true
		path = ARGV[0]+"/class002_homework/"+students_list[array_count]+"*.rb"
		if onTime(path, "Sep", 22, 20)
			homework2_res[array_count] = 2
		else
			homework2_res[array_count] = 1
		end
	else
		homework2_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#Homework 3
Dir.glob(ARGV[0]+"/class003_homework/*.rb").each do |file|
	s = file.split('/').last
	s = s.split('_')[0] + "_" + s.split('_')[1]
	homework3[array_count] = s
	array_count += 1
end

homework3.sort!
array_count = 0

while array_count <= students_list.length
	if homework3.include?(students_list[array_count]) == true
		path = ARGV[0]+"/class003_homework/"+students_list[array_count]+"*.rb"
		if onTime(path, "Sep", 24, 20)
			homework3_res[array_count] = 2
		else
			homework3_res[array_count] = 1
		end
	else
		homework3_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#Homework 4
Dir.glob(ARGV[0]+"/class004_homework/**").each do |folder|
	if File.directory?(folder)
		homework4[array_count] = folder.split('/').last
		array_count += 1
	end
end

homework4.sort!
array_count = 0

while array_count <= students_list.length
	if homework4.include?(students_list[array_count]) == true
		path = ARGV[0]+"/class004_homework/"+students_list[array_count]+"*"
		if onTime(path, "Sep", 29, 20)
			homework4_res[array_count] = 2
		else
			homework4_res[array_count] = 1
		end
	else
		#puts students_list[array_count]
		homework4_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#Homework 9 ~ FAIL OP
	#Check via mapping
mapping = Array.new()
mapping_res = Array.new()
mapping_keys = Array.new()

CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |row|
	if row.last != "Student Name" && row.last != nil
		mapping.push(row.last.split(' ').first + "_" + row.last.split(' ').last)
	end
	if row.first != "Project Name" && row.first != nil
		mapping_keys.push(row.first)
	end
end

mapping_keys.uniq!
array_count = 0

while array_count <= students_list.length
	if mapping.include?(students_list[array_count]) == true
		mapping_res[array_count] = 1
	else
		mapping_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#puts mapping_res

#Homework 12
Dir.glob(ARGV[0]+"/class012_homework/*.rb").each do |file|
	s = file.split('/').last
	s = s.split('_')[0] + "_" + s.split('_')[1]
	homework12[array_count] = s
	array_count += 1
end

homework12.sort!
array_count = 0

while array_count <= students_list.length
	if homework12.include?(students_list[array_count]) == true
		path = ARGV[0]+"/class012_homework/"+students_list[array_count]+"*.rb"
		if onTime(path, "Nov", 10, 20)
			homework12_res[array_count] = 2
		else
			homework12_res[array_count] = 1
		end
	else
		#puts students_list[array_count]
		homework12_res[array_count] = 0
	end
	array_count += 1
end

array_count = 0

#CSV
CSV.open("result_Gergan_Nikolov_B_11.csv", "w") do |csv|
	csv << [" ", " ", "VH", "002", "003", "004", "009", "012"]
	while array_count < students_list.length
		csv << [students_list[array_count].split('_').first, students_list[array_count].split('_').last, vhodno_nivo_res[array_count], homework2_res[array_count], homework3_res[array_count], homework4_res[array_count], mapping_res[array_count], homework12_res[array_count]]
		array_count += 1
	end
end
