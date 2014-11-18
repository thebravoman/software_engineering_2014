require 'csv'

require_relative 'html_writer'
require_relative 'csv_writer'
require_relative 'xml_writer'
require_relative 'json_writer'

hashstudents_vhodno = Hash.new
hashstudents_002 = Hash.new
hashstudents_003 = Hash.new
hashstudents_004 = Hash.new
hashstudents_009 = Hash.new
hashstudents_012 = Hash.new
hashstudents_014 = Hash.new
students = Array.new
all_students = Array.new
files_vhodno_nivo_without_repeat = Array.new

class OptionO
	def check_arguments
		if ARGV[1] == "-o" then
			if ((ARGV[2] == "csv") or (ARGV[2] == "html") or (ARGV[2] == "json") or (ARGV[2] == "xml")) and (ARGV[2] != nil) then
				print "Please wait..."
			else
				print "error: wrong argument for -o: \"#{ARGV[2]}\"\n"
				abort
			end
		end
	end
	def write_to_file_in_the_option(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
		if ARGV[1] == "-o" then
			for i in 2..5
				if ARGV[i] == "csv" then
					CSVWriter.new.write(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
				end
				if ARGV[i] == "html" then
					HTMLWriter.new.write(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
				end
				if ARGV[i] == "xml" then
					XMLWriter.new.write(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
				end
				if ARGV[i] == "json" then
					JSONWriter.new.write(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
				end
			end
		end
	end
end
class String
	def is_number?
		true if Float(self) rescue false
	end
end
class CheckFolders
	def add_a_student_in_all_students(first_name,last_name,all_students)
		if not all_students.include?(["#{first_name}".capitalize, "#{last_name}".capitalize]) then
			all_students<<(["#{first_name}".capitalize, "#{last_name}".capitalize])
		end
	end
	def type_programs(subfolder,hashstudents,git_log_time,all_students)
		Dir.glob(subfolder+"/**/*.*").each do |current_work|
			extension = current_work.split(/\//).last.split(/\./).last
			the_name_of_the_file = current_work.split(/\//).last
			the_name_of_the_student = current_work.split(/\//).last.split(/_/)
			if extension != nil
				if the_name_of_the_student[0]!=nil and the_name_of_the_student[1]!=nil and the_name_of_the_student[0]!="results" and the_name_of_the_student[0]!="Results" and the_name_of_the_file.split(/_/).last.split(/\./).first.is_number? and !the_name_of_the_student[0].include? '.' and !the_name_of_the_student[1].include? '.' and extension.length < 5 and !extension.include? '~' then
					CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
					git_log = `#{git_log_time} #{current_work}`
					if !git_log.empty? then
						hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = 2
					else
						hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = 1
					end
				end
			end
		end
	end
	def type_reports(subfolder,hashstudents,git_log_time,all_students)
		project_to_names = Hash.new
			CSV.foreach("#{subfolder}/project_to_names.csv") do |csv|
				project_to_names[csv[0]] = csv[1]
				if csv[0] != "Project Name" and csv[1] != "Student Name" then
					hashstudents[csv[1]]=1
					the_name_of_the_student = csv[1].split(" ")
					CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
				end
			end
			project_to_names.each do |k, v|
				Dir.glob("#{subfolder}/**/#{k}.pdf").each do |current_work|
					git_log = `#{git_log_time} #{current_work}`
					if !git_log.empty? then
						hashstudents[v]=2
					end
				end
			end
	end
	def type_folders(subfolder,hashstudents,git_log_time,all_students)
		Dir.glob(subfolder+"/*").each do |current_work|
			the_name_of_the_file = current_work.split(/\//).last
			the_name_of_the_student = current_work.split(/\//).last.split(/_/)
			if the_name_of_the_student[0]!=nil and the_name_of_the_student[1]!=nil then
				CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
				git_log = `#{git_log_time} #{current_work}`
				if !git_log.empty? then
					hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = 2
				else
					hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = 1
				end
			end
		end
	end
	def type_3_programs(subfolder,hashstudents,git_log_time,files_vhodno_nivo_without_repeat,students,all_students)
		Dir.glob("#{subfolder}/**/*.*").each do |current_work|
			extension = current_work.split(/\//).last.split(/\./).last
			name = current_work.split(/\//).last.split(/_/)
			if !name[0].include? '.' and !name[1].include? '.' and extension.length < 5 and !extension.include? '~' then
				if not files_vhodno_nivo_without_repeat.include?([current_work.split(/\//).last.split(/\./).first]) then
					files_vhodno_nivo_without_repeat << (["#{current_work.split(/\//).last.split(/\./).first}"])
				end
				if (name[0] != "results") and (name[0] != "Results") then
					hashstudents["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=0
				end				
			end
		end
		files_vhodno_nivo_without_repeat.each do |file|
			name = "#{file}".split(/_/)
			students << (["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize])
		end
		b = Hash.new(0)
		students.each do |v|
			b[v] += 1
		end
		b.each do |k, v|
			if k!=nil
				k = "#{k}".split(/\"/)[2].split(" ").first.capitalize + " " + "#{k}".split(/\"/)[2].split(" ").last.capitalize
				if (v >= 3) then
					hashstudents[k] += 1
				end
			end
		end
		Dir.glob(subfolder+"/**/*.*").each do |current_work|
			extension = current_work.split(/\//).last.split(/\./).last
			the_name_of_the_file = current_work.split(/\//).last
			the_name_of_the_student = current_work.split(/\//).last.split(/_/)
			if extension != nil
				if the_name_of_the_student[0]!=nil and the_name_of_the_student[1]!=nil and the_name_of_the_student[0]!="results" and the_name_of_the_student[0]!="Results" and the_name_of_the_file.split(/_/).last.split(/\./).first.is_number? and !the_name_of_the_student[0].include? '.' and !the_name_of_the_student[1].include? '.' and extension.length < 5 and !extension.include? '~' then
					CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
					git_log = `#{git_log_time} #{current_work}`
					if !git_log.empty? and hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize]>=1 then
						hashstudents[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] += 1
					end
				end
			end
		end
		hashstudents.each do |k, v|
			if (v >= 4) then
				hashstudents[k] = 2
			else
				if not (hashstudents[k] == 0)
					hashstudents[k] = 1
				end
			end
		end
	end
end
class DefaultHashes
	def set_hash_nills_to_zero(all_students,hashstudents)
		all_students.each do |first_name,last_name|
			if hashstudents["#{first_name}"+" "+"#{last_name}"] == nil  then
				hashstudents["#{first_name}"+" "+"#{last_name}"] = 0
			end
		end
	end
end

Dir.chdir "#{ARGV[0]}"
OptionO.new.check_arguments
Dir.glob("#{ARGV[0]}/*").each do |subfolder|
	if (subfolder.split(/\//).last == "class002_homework") then
		CheckFolders.new.type_programs(subfolder,hashstudents_002,"git log --after=15.09.2014:11:10:00 --until=22.09.2014:20:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "class003_homework") then
		CheckFolders.new.type_programs(subfolder,hashstudents_003,"git log --after=15.09.2014:11:10:00 --until=24.09.2014:20:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "class004_homework") then
		CheckFolders.new.type_folders(subfolder,hashstudents_004,"git log --after=15.09.2014:11:10:00 --until=29.09.2014:20:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "class009_homework") then
		CheckFolders.new.type_reports(subfolder,hashstudents_009,"git log --after=15.09.2014:11:10:00 --until=27.10.2014:20:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "class012_homework") then
		CheckFolders.new.type_programs(subfolder,hashstudents_012,"git log --after=15.09.2014:11:10:00 --until=10.11.2014:20:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "class014_homework") then
		CheckFolders.new.type_programs(subfolder,hashstudents_014,"git log --after=15.09.2014:11:10:00 --until=13.11.2014:06:00:00",all_students)
	end
	if (subfolder.split(/\//).last == "vhodno_nivo") then
		CheckFolders.new.type_3_programs(subfolder,hashstudents_vhodno,"git log --after=15.09.2014:11:10:00 --until=17.09.2014:20:00:00",files_vhodno_nivo_without_repeat,students,all_students)
	end
end
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_002)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_003)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_004)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_009)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_012)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_014)
DefaultHashes.new.set_hash_nills_to_zero(all_students,hashstudents_vhodno)
OptionO.new.write_to_file_in_the_option(hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
