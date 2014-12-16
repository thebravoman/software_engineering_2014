	require 'yaml'
	require 'thread'
	require 'shellwords'
	require 'open3'
	require_relative "git_time_checker.rb"
	require_relative "writer.rb"
	
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
	
	def flog_step(flog_)
		stdin,stdout,stderr = Open3.popen3("#{flog_.last}")
		result_ = stdout.read.split("\n").first.to_i
		stdin.close
		stderr.close
		stdout.close 
		return "#{result_}|#{flog_[0]}|#{flog_[1]}"
	end 
	def flay_step(flay_) 
		stdin,stdout,stderr = Open3.popen3("#{flay_.last}")
		result_ = stdout.read.to_i
		stdin.close
		stderr.close
		stdout.close 
		return "#{result_}|#{flay_[0]}|#{flay_[1]}"
	end 
	def clearBuffer(prev_output_length) 
		prev_output_length.times { print "\b" }
	end
	def deleteSymbols(symbols) 
		symbols.times { print " " }
	end 
	
	relative_dir = ARGV.shift	|| "Error" #Directory of the repository to be checked.

		
	gitLog = GitTimeChecker.new
	students = Hash.new
	threads_arr = Array.new
	program_finished = false 
	
	flay_queue = Queue.new
	flog_queue = Queue.new
	write_queue = Queue.new
	
	time = Time.now
	
	config_file_path = "config.yml"
	if not File.exists?(config_file_path)
		puts "Config file not found. Switching to failsafe."
		config_file_path = relative_dir +"/class018_homework/Stefan_Iliev_B_28/config.yml"
		if not File.exists?(config_file_path)
			puts "Failsafe failed. Exiting..."
			exit()
		end 
	end 
	config = YAML.load_file(config_file_path)
	times = config["times"]
	regex = config["regex"]
	directories = config["directories"]
	fc = config["file_count"]
	homeworks_count = config["homeworks_count"]
	translate_files = config["translate_files"]
	flog_header = config["headers"]["flog"]
	flay_header = config["headers"]["flay"]
	flog_single = config["flog_single"]
	flog_threads = config["flog_threads"]
	flay_threads = config["flog_threads"]
	
	if relative_dir == "Error"
		puts "Pass the path to the repository to be checked as argument.\n\nSpecify writer type with -o TYPE\n\nWriter types:JSON,HTML,XML,CSV,SVG or ALL\n\nTurn time saver on with -n NUMBER\n\n"
		exit()
	end 
	
	flog_threads.times do 
		threads_arr << Thread.new {
			while !program_finished do 
				flog_ = flog_queue.pop().split("|||S|||")
				write_queue << flog_step(flog_)
			end 
		}
	end 
	puts "Launched #{flog_threads} flog threads."
	
	flay_threads.times do
		threads_arr << flay_t = Thread.new {
			while !program_finished do 
				flay_ = flay_queue.pop().split("|||S|||")
				write_queue << flay_step(flay_)
			end 
		}
	end 
	
	puts "Launched #{flay_threads} flay threads."

	homeworks_to_check = -1
	if (homeworks_to_check = ARGV[(ARGV.index("-n") || -10) + 1]) == -9 #nil crash workaround. Will go here if it is nil.
		homeworks_to_check = -1
		puts "Time saver is off."
	end 
	
	
	prev_output_length = 0;
	for count in 1..homeworks_count
			directory = relative_dir + directories["dir#{count}"]
			output = "Queueing directory: #{directory}"
			
			print "\r#{output}"
			deleteSymbols(prev_output_length - (prev_output_length = output.length))

			
			loop_break = homeworks_to_check.to_i
			
			Dir.glob(directory).each do | file_path| 
				
				full_file_name = file_path.split("/").last.split(".").first 
				student_name = getStudentName(full_file_name) 
				
				if not full_file_name =~ /#{regex["reg#{count}"]}/ 
					next
				end 
				
				result = gitLog.checkLog(file_path,times["time#{count}"],1,false).to_i 
				
				if (file = translate_files["hw#{count}"]) != nil
					prev_s_name = student_name
					`grep '#{full_file_name.shellescape}' #{relative_dir + file}`.split("\n").each do | line |
						next if line.empty?
						student_name = line.split(",").last
						student_name = student_name.tr(" ","_")
						students[student_name] = CreateStudent(homeworks_count) if students[student_name] == nil
						students = writeResult(students,student_name,count,result)
					end 
					if prev_s_name == student_name
						students[student_name] = CreateStudent(homeworks_count) if students[student_name] == nil
						students = writeResult(students,student_name,count,result)
					end 
				else 
					students[student_name] = CreateStudent(homeworks_count) if students[student_name] == nil
					students = writeResult(students,student_name,count,result)
				end 
				old_file_path = file_path
				if flog_single["hw_#{count}"] == nil
					file_path = file_path.chomp(file_path.split("/").last)
				end 
				if flog_header.split("|")[count-1] != "-"
					flog_queue << "#{student_name}|||S|||flog_#{count}|||S|||flog #{file_path}"
				end

				if flay_header.split("|")[count-1] != "-"
					flay_queue << "#{student_name}|||S|||flay_#{count}|||S|||flay #{old_file_path} |grep #{student_name} |wc -l" 
				end
				loop_break -= 1
				if loop_break == 0
					 break
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
	
	prev_output_length = 0
	print "\n"
	while !flog_queue.empty?() 
		flog_ = flog_queue.pop().split("|||S|||")
		write_queue << flog_step(flog_)
		print "\r" 
		output = "Homeworks remaining: #{flog_queue.length + flay_queue.length}"
		print output
		deleteSymbols(prev_output_length - (prev_output_length = output.length))
	end
	
	while !flay_queue.empty?() 
		flay_ = flay_queue.pop().split("|||S|||")
		write_queue << flay_step(flay_) 
		print "\r" 
		output = "Homeworks remaining: #{flay_queue.length}"
		print output
		deleteSymbols(prev_output_length - (prev_output_length = output.length))
	end 
	print "\n"
	program_finished = true 
	puts "Threads Synchronized."
	
	while !write_queue.empty?() 
		write_ = write_queue.pop().split("|")
		students[write_[1]][write_[2]] = write_[0]
	end 
	
	students = Hash[students.sort_by{|k,v| k}]
	puts "Runtime: #{Time.now - time} sec."
	ResultWriter.write( ARGV[(ARGV.index("-o") || 0) + 1],students , config_file_path)
	
