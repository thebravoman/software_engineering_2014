require 'csv'
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "csv_writer.rb"
require_relative "html_writer.rb"

start_time = Time.now
studentsVH = Array.new
students002 = Array.new
students003 = Array.new
students004 = Array.new
students009 = Array.new
students012 = Array.new
students014 = Array.new
students0171 = Array.new
students0172 = Array.new
all_students = Array.new
resultsVH = Array.new
results002 = Array.new
results003 = Array.new
results004 = Array.new
results009 = Array.new
results012 = Array.new
results014 = Array.new
results0171 = Array.new
results0172 = Array.new
flog002 = Array.new
flog003 = Array.new
flog004 = Array.new
flog012 = Array.new
flog014 = Array.new
flog009 = Array.new
flogVH = Array.new
flog0171 = Array.new
flog0172 = Array.new

def time(path, month, date, time)
	gitLog = `git log --reverse #{path}`
	gitLog = gitLog.split(" 2014").first.split("Date:   ").last.split(" +").first.split(" ")
	month2 = gitLog[1]
	date2 = gitLog[2].to_i
	time2 = gitLog[3].split(":").first.to_i
	if month2 != month  
		return false 
	end
	if date2 > date  
		return false
	end
	if date2 == date && time2 >= time 
		return false 
	end
	
	return true
end

def dir_glob(date, path, array_students, students)
	Dir.glob("#{ARGV[0]}" +"#{path}") do |my_text_file|
		s = my_text_file.split('/').last
		if s.split("_").length >= 3 && !s.split(".").last.include?("~")
			if s.include?("result") then
				s = s.split("_", 2).last
			end
			if time(my_text_file,date[0], date[1], date[2])
				s = s.split("_")
				students << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
				flog1 = `flog #{my_text_file}`
				array_students << ["#{s[0].capitalize}", "#{s[1].capitalize}", "true", "#{flog1.split(":").first}"]
			else 
				s = s.split("_")
				students << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
				flog1 = `flog #{my_text_file}`
				array_students << ["#{s[0].capitalize}", "#{s[1].capitalize}", "false", "#{flog1.split(":").first}"]
			end
		end
	end
end

dir_glob(["Sep", 22, 20], "class002_homework/**/*.rb", students002, all_students)
dir_glob(["Sep", 24, 20], "class003_homework/**/*.rb", students003, all_students)
dir_glob(["Sep", 29, 20], "class004/**/*.rb", students004, all_students)
dir_glob(["Nov", 10, 20],"class012_homework/**/*.rb", students012, all_students)
dir_glob(["Nov", 13, 06],"class014_homework/*", students014, all_students)
dir_glob(["Dec", 2, 06],"class017_homework/homework1/*", students0171, all_students)
dir_glob(["Dec", 2, 06],"class017_homework/homework2/*", students0172, all_students)

CSV.foreach("#{ARGV[0]}" +"/class009_homework/project_to_names.csv") do |csv|
	if csv[0] != "Project Name" && csv[1] != 	"Student Name"
		team = csv[0]
		first = csv[1].split(" ")[0]
		last = csv[1].split(" ")[1]
		students009 << ["#{first} #{last}", "#{team}"]
	end
end

def dir_globVH(date, path, array_students, students)
	Dir.glob("#{ARGV[0]}" +"#{path}") do |my_text_file|
		count = 0
		s = my_text_file.split('/').last
		Dir.glob("#{my_text_file}/*.*") do |file|
			name = file.split('/').last
			count = count +1
		end
		if count >= 3 
			if s.split("_").length >= 3 && !s.split(".").last.include?("~")
				if time(my_text_file,date[0], date[1], date[2])
					s = s.split("_")
					students << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
					array_students << ["#{s[0].capitalize}", "#{s[1].capitalize}", "true"]
				else 
					s = s.split("_")
					students << ["#{s[0].capitalize}", "#{s[1].capitalize}"]
					array_students << ["#{s[0].capitalize}", "#{s[1].capitalize}", "false"]
				end
			end
		end
	end
end

dir_globVH(["Sep", 17, 20], "vhodno_nivo/**/*", studentsVH, all_students)

def dir_glob009(date, path, array_students, students)
	n = 0
	Dir.glob("#{ARGV[0]}" +"#{path}") do |my_text_file|
		team_name = my_text_file.split('/').last
			if time("#{ARGV[0]}" +"#{path}",date[0], date[1], date[2])
				array_students.each do |names, teams|
					if team_name.include?(teams)
						first_name = array_students[n][0].split(" ").first
						last_name = array_students[n][0].split(" ").last
						students << ["#{first_name.capitalize}", "#{last_name.capitalize}"]
						array_students << ["#{first_name.capitalize}", "#{last_name.capitalize}", "true"]
						n+=1
					end
				end
			end
	end	
end
dir_glob009(["Oct", 27, 20],"class009_homework/**/*.pdf", students009, all_students)



all_students.uniq!
def results(students,array_students,array_results, flog)
	i = 0 
	students.each do |first1, last1|
		array_students.each do |first2, last2, result, flog1|
			if first1 == first2 && last1 == last2
				i += 1
				if result == "true"
					array_results << 2
					flog << "#{flog1}"
				else array_results << 1
					flog << "#{flog1}"
				end
			end				
		end
		if i == 0 
			array_results << 0
			flog << 0
		end
		i =0	
	end
end

results(all_students, studentsVH, resultsVH, flogVH)
results(all_students, students002, results002, flog002)
results(all_students, students003, results003, flog003)
results(all_students, students004, results004, flog004)
results(all_students, students009, results009, flog009)
results(all_students, students012, results012, flog012)
results(all_students, students014, results014, flog014)
results(all_students, students0171, results0171, flog0171)
results(all_students, students0172, results0172, flog0172)
time_program = Time.now - start_time

if ARGV[1] == "-o"
	case ARGV[2]
	when "csv"
		writer = CSVwriter.new
		writer.write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, results0171, results0172, flog002, flog003, flog004, flog012, flog014, flog0171, flog0172)
	when "html"
		writer = HTMLwriter.new
		writer.write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, results0171, results0172, flog002, flog003, flog004, flog012, flog014, flog0171, flog0172)
	when "xml"
		writer = XMLwriter.new
		writer.write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, results0171, results0172, flog002, flog003, flog004, flog012, flog014, flog0171, flog0172)
	when "json"
		writer = JSONwriter.new
		writer.write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, results0171, results0172, flog002, flog003, flog004, flog012, flog014, flog0171, flog0172)
	else puts "You put in wrong format!"
	end
end



