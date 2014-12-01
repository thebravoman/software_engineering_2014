require "./csv_writer.rb"
require "./xml_writer.rb"
require "./html_writer.rb"
require "./json_writer.rb"
start_time = Time.now

directories = Array.new
directories = ["/vhodno_nivo/**/*.*", "/class002_homework/**/*.rb", "/class003_homework/**/*.rb", '/class004/**/*.rb', "/class009_homework/", "/class012_homework/**/*.rb", "/class014_homework/**/*.rb", "/class017_homework/homework2/**/*.rb", "class017_homework/homework1/**/*.*"]
$students = Hash.new do |hash,key|
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new 
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	
end

def loop_hw(log, directory, hw_num) 
	Dir.glob(ARGV[0] + directory) do |file| 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		log_local = `#{log} #{file}`

		if !log_local.empty? && personName != nil
			$students[personName][hw_num] = "2"	
		elsif log_local.empty? && personName != nil 
			$students[personName][hw_num] = "1"	
		end
	end
end

def use_flog(directory, hwf_num)
	Dir.glob(ARGV[0] + directory) do |file| 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		flog = `flog #{file}`.split(":").first
		$students[personName][hwf_num] = flog
	end
end

def use_flay(directory, hw_num)
	Dir.glob(ARGV[0] + directory) do |file| 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		firstName = file.split("/").last.split("_")[0].capitalize
		flay = `flay #{file} | grep #{firstName} | wc -l`.to_i
		$students[personName][hw_num] = flay
	end	
end

#main----------------------------------------------------------------------

Dir.chdir(ARGV[0])
loop_hw "git log --until=17.Sep.2014--20:00:00", directories[0], "01"
loop_hw "git log --until=22.Sep.2014--20:00:00", directories[1], "02"
	use_flog directories[1], 'g2'
	use_flay directories[1], 'y2'
loop_hw "git log --until=24.Sep.2014--20:00:00", directories[2], "03"
	use_flog directories[2], 'g3'
	use_flay directories[2], 'y3'
loop_hw "git log --until=27.Sep.2014--20:00:00", directories[3], "04"
	use_flog directories[3], 'g4'
	use_flay directories[3], 'y4'
loop_hw "git log --until=10.Nov.2014--20:00:00", directories[5], "12"
	use_flog directories[5], 'g12'
	use_flay directories[5], 'y12'

loop_hw "git log --until=02.Dec.2014--06:00:00", directories[8], "171"
	use_flog directories[8], 'g171'
	use_flay directories[8], 'y171'


#homework 14
Dir.glob(ARGV[0] + directories[6]) do |file| 
	if  file.split(".").first.split("/").last.split("_").last =~ /\A\d+\z/ 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		log_local = `git log --until=13.Nov.2014--06:00:00 #{file}`

		if !log_local.empty? && personName != nil
			$students[personName]['14'] = "2"	
		elsif log_local.empty? && personName != nil 
			$students[personName]['14'] = "1"	
		end
	end
end

Dir.glob(ARGV[0] + directories[6]) do |file| 
	if  file.split(".").first.split("/").last.split("_").last =~ /\A\d+\z/ 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		flog = `flog #{file}`.split(":").first
		$students[personName]['g14'] = flog

		#flay
		firstName = file.split("/").last.split("_")[0].capitalize
		flay = `flay #{file} | grep #{firstName} | wc -l`.to_i
		$students[personName]['y14'] = flay
	end
end

Dir.glob(ARGV[0] + directories[7]) do |file| 
	if  file.split(".").first.split("/").last.split("_").last =~ /\A\d+\z/ 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		log_local = `git log --until=02.Dec.2014--06:00:00 #{file}`

		if !log_local.empty? && personName != nil
			$students[personName]['172'] = "2"	
		elsif log_local.empty? && personName != nil 
			$students[personName]['172'] = "1"	
		end
	end
end

Dir.glob(ARGV[0] + directories[7]) do |file| 
	if  file.split(".").first.split("/").last.split("_").last =~ /\A\d+\z/ 
		personName = file.split("/").last.split("_")[0].capitalize + "," + file.split("/").last.split("_")[1].capitalize if file.split("/").last.split("_")[1] != nil
		flog = `flog #{file}`.split(":").first
		$students[personName]['g172'] = flog

		#flay
		firstName = file.split("/").last.split("_")[0].capitalize
		flay = `flay #{file} | grep #{firstName} | wc -l`.to_i
		$students[personName]['y172'] = flay
	end
end

Dir.glob(ARGV[0] + directories[4] + "/**/*.pdf") do |file| #class09
	teams = Hash.new
	log = `git log --until=27.Oct.2014--20:00:00 #{file}`
	CSV.foreach(ARGV[0] + directories[4] + "project_to_names.csv") do |row| #getting name => team hash
		person = row.inspect.split(",")[1].split('"')[1]
		team = row.inspect.split(",")[0].split('"')[1]
		if person != nil && person != "Studen Name"
			personName = row.inspect.split(",")[1].split('"')[1].split(" ")[0] + "," + row.inspect.split(",")[1].split('"')[1].split(" ")[1]
			teams[personName] = team
		end

		if !log.empty?
			$students[personName]['09'] = "2"
		elsif log.empty?
			$students[personName]['09'] = "1"
		end
	end
end


$students.each do |k,v|
	if $students[k]['01'] == nil then  $students[k]['01'] = "0" end
	if $students[k]['02'] == nil then  $students[k]['02'] = "0" end
	if $students[k]['03'] == nil then  $students[k]['03'] = "0" end
	if $students[k]['04'] == nil then  $students[k]['04'] = "0" end
	if $students[k]['09'] == nil then  $students[k]['09'] = "0" end
	if $students[k]['12'] == nil then  $students[k]['12'] = "0" end
	if $students[k]['14'] == nil then  $students[k]['14'] = "0" end
	if $students[k]['172'] == nil then  $students[k]['172'] = "0" end
	if $students[k]['171'] == nil then  $students[k]['171'] = "0" end
end

time_end = start_time - Time.now
puts time_end
case ARGV[2]
	when "csv"
		writer = CSVWriter.new
	when "html"
		writer = HTMLWriter.new
	when "xml"
		writer = XMLWriter.new
	when "json"
		writer = JSONWriter.new
                              end

writer.write($students)

