	require 'yaml'
	require_relative "git_time_checker.rb"
	require_relative "Writer.rb"
	
	def CreateStudent( homeworks_count )
		hash = Hash.new
		for i in 1..homeworks_count do 
			hash["homework_#{i}"] = 0	
			hash["flog_#{i}"] = "-"
			hash["flay_#{i}"] = "-" 
			hash["hc_#{i}"] = 0
			hash["hcl_#{i}"] = 0
		end 	
		return hash
	end
	
	def getStudentName( element ) 
		if element.count("_") < 2
			return "invalid_invalid"
		end
		student_name = element
		student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
		return student_name
	end 
	
	def writeResult( students, student_name, count, result) 
		if result != -1
			students[student_name]["hc_#{count}"] += 1
		else 
			students[student_name]["hcl_#{count}"] += 1
		end 
		return students
	end 
	
	relative_dir = ARGV.shift	
	gitLog = GitTimeChecker.new
	students = Hash.new
	
	config = YAML.load_file("config.yml")
	times = config["times"]
	regex = config["regex"]
	directories = config["directories"]
	fc = config["file_count"]
	homeworks_count = config["homeworks_count"]
	translate_files = config["translate_files"]
	
	for count in 1..homeworks_count
			directory = relative_dir + directories["dir#{count}"]
			p directory
			Dir.glob(directory).each do | file_path| 
			
				full_file_name = file_path.split("/").last.split(".").first 
				student_name = getStudentName(full_file_name) 
				
				if not full_file_name =~ /#{regex["reg#{count}"]}/ 
					next
				end 
				students[student_name] = CreateStudent(homeworks_count) if students[student_name] == nil
				
				result = gitLog.checkLog(file_path,times["time#{count}"],1,false).to_i 
				
				if (file = translate_files["hw#{count}"]) != nil
					`grep #{full_file_name} #{relative_dir + file}`.split("\n").each do | line |
						students = writeResult(students,student_name,count,result)
					end 
				else 
					students = writeResult(students,student_name,count,result)
				end 
			end 
			
		
			
			students.each do |name, hw|
				if hw["hc_#{count}"] > (fc["fc_#{count}"] || 0) 
					hw["homework_#{count}"] = 2
				else 
					if hw["hcl_#{count}"] > 0 then hw["homework_#{count}"] = 1 end 
				end 
			end 
	end
	
	ResultWriter.write( ARGV[ARGV.index("-o") + 1],students )
	