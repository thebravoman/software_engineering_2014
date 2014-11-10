require "csv"
results = Hash.new{|hash, key| hash[key] = [0,0,0,0,0,0]}
folder = 0
teams_hash=Hash.new{|hash, key| hash[key] = []}
time_hash=Hash.new{|hash, key| hash[key] = []}
dir = ARGV[0] + "class009_homework/"
firstLine = "FirstName LastName","VH","002","003","004","009","012"
folder_name = ["vhodno_nivo","class002_homework", "class003_homework","class004","class009_homework","class012_homework"]
student_all= Hash.new { |name, programs| name[programs] = []}
student_time= Hash.new { |name, programs| name[programs] = []}
class String
  def is_number?
    Float(self) != nil rescue false
  end
end
(0..5).each do |j|
	Dir.glob(ARGV[0]+"/#{folder_name[j]}/*.*").each do |repository|
		prog_name = repository.split("/").last
		counter = prog_name.count "_"
		if counter == 3
			case j
				when 0 then 
				when 1 then git_log = `git log --until=22.09.2014:20:00:00 #{repository}` 
				when 2 then git_log = `git log --until=24.09.2014:20:00:00 #{repository}` 
				when 3 then git_log = `git log --until=29.09.2014:20:00:00 #{repository}` 
				when 4 then 
				when 5 then git_log = `git log --until=10.11.2014:20:00:00 #{repository}` 
			end	
name_last = repository.split("/").last.split("_", 2).last.split("_",2).first.capitalize
name_first = repository.split("/").last.split("_", 2).first.capitalize
#script_file1 = repository.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")
		
			if (j!= 0 && j != 4)
				if !git_log.empty?
					 results["#{name_first} #{name_last}"][folder] = 2
				elsif git_log.empty?
					 results["#{name_first} #{name_last}"][folder] = 1	
				end
			end
		end
	end
	folder += 1
end

f = File.open("#{dir}project_to_names.csv", "r")
f.each do |line|
	if line.start_with? ',' 
		elsif !line.include?("Progect Name")
  			team = line.split(",").first
			names = line.split(",").last
			teams_hash[team] << names.gsub("\n","")
		end
end  
f.close

Dir.glob("#{dir}"+"*").each do |report|
 team_name = report.split(/\//).last.split(".").first
log = `git log --until=Mon--Oct--27--20:00:00--2014 -- #{report}`
					 if !log.empty?
						#print "ON TIME"
					 	team_name = report.split(/\//).last.split(".").first
					   	time_hash[team_name] << "2"
					  elsif log.empty?
						#print "NOT ON TIME"
					   	team_name1 = report.split(/\//).last.split(".").first
					   	time_hash[team_name1] << "1"
					  end
end
	teams_hash.each do |team, names|
		time_hash.each do |team1, time|
			if team == team1
				names.each do |n|
                                        results[n][4] = time
				end
			end
		end
	end
dir1 = ARGV[0] + "vhodno_nivo"
Dir.glob("#{dir1}/**/*.*").each do |program|
file_split = program.split(/\//).last
first_name = program.split(/\//).last.split(/_/).first.capitalize	
last_name = program.split(/\//).last.split(/_/, 2).last.split("_").first.capitalize
task_number = program.split(/\//).last.split("_").last.split(".").first
    p=file_split.split("_").length
log = `git log --until=17.09.2014:20:00:00 -- #{program}` 

		if ((first_name != "") || (first_name != " ") || (last_name != "") || (last_name != " "))
			if p == 3
				if (task_number.is_number?)&&(task_number.to_i >1)&&(task_number.to_i < 19)
					if !log.empty?
						student_all["#{first_name} #{last_name}"] << task_number.to_i
						student_time["#{first_name} #{last_name}"] ="2"
					elsif log.empty?
						student_all["#{first_name} #{last_name}"] << task_number.to_i
						student_time["#{first_name} #{last_name}"] ="1"
					end
				end
			end
		end
end
folder_VN = 0
student_all.sort.each do |name_all, prog|
count = 0
	prog.uniq.each{|val| count+=1}
	if count>=3
		student_time.each do |name_time,t|
			if name_all == name_time 
				results[name_time][folder_VN] = t
			end
		end
	end
end
CSV.open("results_Elena_Karakoleva_A_8.csv","w") do |csv|
	csv << firstLine
	results.keys.sort.uniq.each do |key|
 		csv << [key, results[key]].flatten
 	end
end
