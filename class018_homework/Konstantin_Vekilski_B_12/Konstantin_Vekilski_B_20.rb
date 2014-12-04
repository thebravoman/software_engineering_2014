require 'csv'
require 'yaml'

#require_relative 'html_writer'
require_relative 'csv_writer'
#require_relative 'xml_writer'
#require_relative 'json_writer'
#require_relative 'svg_writer'

start = Time.now
folders_and_types = YAML.load_file("config.yml")
results = Hash.new(0)
students = Array.new
all_students = Array.new
files_vhodno_nivo_without_repeat = Array.new

class OptionO
	def check_arguments
		if ARGV[1] == "-o" then
			#for i in 2..6
				#if ((ARGV[i] == "csv") or (ARGV[i] == "html") or (ARGV[i] == "json") or (ARGV[i] == "xml") or (ARGV[i] == "svg") or (ARGV[i] == nil)) then
				if (ARGV[2] == "csv") then #Because the script is not completed for now :)
				else
					print "error: wrong argument for -o: \"#{ARGV[2]}\"\n"
					abort
				end
			#end
		end
	end
	def write_to_file_in_the_option(seconds,results,the_number_of_the_keys)
		if ARGV[1] == "-o" then
			#for i in 2..6
				if ARGV[2] == "csv" then
					CSVWriter.new.write(seconds,results)
				end
				#if ARGV[i] == "html" then
				#	HTMLWriter.new.write(seconds,results)
				#end
				#if ARGV[i] == "xml" then
				#	XMLWriter.new.write(seconds,results)
				#end
				#if ARGV[i] == "json" then
				#	JSONWriter.new.write(seconds,results)
				#end
				#if ARGV[i] == "svg" then
				#	SVGWriter.new.write(seconds,results,the_number_of_the_keys)
				#end
			#end
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
	def type_programs(homework,subfolder,results,git_log_time,all_students)
		Dir.glob(subfolder+"/**/*.*").each do |current_work|
			extension = current_work.split(/\//).last.split(/\./).last
			the_name_of_the_file = current_work.split(/\//).last
			the_name_of_the_student = current_work.split(/\//).last.split(/_/)
			if extension != nil
				if the_name_of_the_student[0]!=nil and the_name_of_the_student[1]!=nil and the_name_of_the_student[0]!="results" and the_name_of_the_student[0]!="result" and the_name_of_the_student[0]!="Results" and the_name_of_the_file.split(/_/).last.split(/\./).first.is_number? and !the_name_of_the_student[0].include? '.' and !the_name_of_the_student[1].include? '.' and extension.length < 5 and !extension.include? '~' then
					CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
					git_log = `#{git_log_time} #{current_work}`
					if extension == "rb" then
						flay_result = `flay #{current_work} |grep #{the_name_of_the_student[0]}| wc -l`.split(/\n/).first
						flog_result = `flog #{current_work}`
						if !flog_result.empty? then
							flog_result = flog_result.split(/\n/).first.split(":").first.split(" ").last
						end
						print ("#{subfolder} #{the_name_of_the_student[0]} : flog = #{flog_result} ; flay = #{flay_result} \n")
					end
					if !git_log.empty? then
						if results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] == 0 then
							results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize]=Hash.new(0)
					end
						results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework] = 2
					else
						if results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] == 0 then
							results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize]=Hash.new(0)
					end
						results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework] = 1
					end
					
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize]["y#{homework}"] = flay_result.to_i
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize]["g#{homework}"] = flog_result.to_f
				end
			end
		end
	end
	def type_reports(homework,subfolder,results,git_log_time,all_students)
		project_to_names = Hash.new(0)
			CSV.foreach("#{subfolder}/project_to_names.csv") do |csv|
				project_to_names[csv[0]] = csv[1]
				if csv[0] != "Project Name" and csv[1] != "Student Name" then
					if results[csv[1]] == 0 then
					results[csv[1]]=Hash.new(0)
					end
					results[csv[1]][homework]=1
					the_name_of_the_student = csv[1].split(" ")
					CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
				end
			end
			project_to_names.each do |k, v|
				Dir.glob("#{subfolder}/**/#{k}.pdf").each do |current_work|
					git_log = `#{git_log_time} #{current_work}`
					if !git_log.empty? then
						results[v][homework]=2
					end
				end
			end
	end
	def type_folders(homework,subfolder,results,git_log_time,all_students)
		Dir.glob(subfolder+"/*").each do |current_work|
			the_name_of_the_file = current_work.split(/\//).last
			the_name_of_the_student = current_work.split(/\//).last.split(/_/)
			if the_name_of_the_student[0]!=nil and the_name_of_the_student[1]!=nil then
				CheckFolders.new.add_a_student_in_all_students(the_name_of_the_student[0],the_name_of_the_student[1],all_students)
				git_log = `#{git_log_time} #{current_work}`
				if !git_log.empty? then
					if results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] == 0 then
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = Hash.new(0)
					end
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework] = 2
				else
					if results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] == 0 then
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize] = Hash.new(0)
					end
					results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework] = 1
				end
			end
		end
	end
	def type_3_programs(homework,subfolder,results,git_log_time,files_vhodno_nivo_without_repeat,students,all_students)
		Dir.glob("#{subfolder}/**/*.*").each do |current_work|
			extension = current_work.split(/\//).last.split(/\./).last
			name = current_work.split(/\//).last.split(/_/)
			if !name[0].include? '.' and !name[1].include? '.' and extension.length < 5 and !extension.include? '~' then
				if not files_vhodno_nivo_without_repeat.include?([current_work.split(/\//).last.split(/\./).first]) then
					files_vhodno_nivo_without_repeat << (["#{current_work.split(/\//).last.split(/\./).first}"])
				end
				if (name[0] != "results") and (name[0] != "Results") then
					if results["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize] == 0 then
						results["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=Hash.new(0)
					end
					results["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize][homework]=0
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
					results[k][homework] += 1
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
					if !git_log.empty? and results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework]>=1 then
						results[the_name_of_the_student[0].capitalize+" "+the_name_of_the_student[1].capitalize][homework] += 1
					end
				end
			end
		end
		results.each do |k, v|
			if (v[homework] >= 4) then
				results[k][homework] = 2
			else
				if not (results[k][homework] == 0)
					results[k][homework] = 1
				end
			end
		end
	end
end

the_number_of_the_keys = folders_and_types.keys.length
Dir.chdir "#{ARGV[0]}"
OptionO.new.check_arguments
folders_and_types.each do |key,value|
	if (value[1] == "type_3_programs") then
		CheckFolders.new.type_3_programs(key,"#{ARGV[0]}/#{value[0]}",results,value[2],files_vhodno_nivo_without_repeat,students,all_students)
	end
	if (value[1] == "type_programs") then
		CheckFolders.new.type_programs(key,"#{ARGV[0]}/#{value[0]}",results,value[2],all_students)
	end
	if (value[1] == "type_folders") then
		CheckFolders.new.type_folders(key,"#{ARGV[0]}/#{value[0]}",results,value[2],all_students)
	end
	if (value[1] == "type_reports") then
		CheckFolders.new.type_reports(key,"#{ARGV[0]}/#{value[0]}",results,value[2],all_students)
	end
end
seconds = Time.now - start
p results
OptionO.new.write_to_file_in_the_option(seconds,results,the_number_of_the_keys)
