require 'csv'

require_relative 'html_writer'
require_relative 'csv_writer'
require_relative 'xml_writer'
require_relative 'json_writer'

hashstudents = Hash.new #vhodno
hashstudents2 = Hash.new #004
hashstudents3 = Hash.new #002
hashstudents4 = Hash.new #003
hashstudents5 = Hash.new #012
hashstudents6 = Hash.new #009

if ARGV[1] == "-o" then
	if ((ARGV[2] == "csv") or (ARGV[2] == "html") or (ARGV[2] == "json") or (ARGV[2] == "xml")) and (ARGV[2] != nil) then
		print "Please wait..."
	else
		print "error: wrong argument for -o: \"#{ARGV[2]}\"\n"
		abort
	end
end

students = Array.new
files_vhodno_nivo_without_repeat = Array.new
currentdir = Dir.pwd
Dir.chdir "#{ARGV[0]}"
#git_log = `git log --after="25.09.2014:11:10:00" --until=29.09.2014:20:00:00 #{script_file}`

Dir.glob("#{ARGV[0]}/*").each do |subfolder|
	if (subfolder.split(/\//).last.split(/_/).last == "homework") or (subfolder.split(/\//).last.split(/_/).last == "nivo")
	#p subfolder.split(/\//).last
		if (subfolder.split(/\//).last == "vhodno_nivo") or (subfolder.split(/\//).last == "class004_homework") then
			if (subfolder.split(/\//).last == "vhodno_nivo")
				Dir.glob("#{subfolder}/**/*.*").each do |myfile|
					extension = myfile.split(/\//).last.split(/\./).last
					name = myfile.split(/\//).last.split(/_/)
					if extension.length < 5 and !extension.include? '~'
						#p myfile.split(/\//).last
					end
					if !name[0].include? '.' and !name[1].include? '.' then
							if not files_vhodno_nivo_without_repeat.include?([myfile.split(/\//).last.split(/\./).first]) then
								files_vhodno_nivo_without_repeat << (["#{myfile.split(/\//).last.split(/\./).first}"])
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
			#p students
			end
			if (subfolder.split(/\//).last == "class004_homework") then
				Dir.glob("#{subfolder}/*").each do |mysubfolder|
					mysubfolder = mysubfolder.split(/\//).last.split(/_/)
					if !mysubfolder[0].include? '.' and !mysubfolder[1].include? '.' then
						if (mysubfolder[0] != "results") and (mysubfolder[0] != "Results") then
						hashstudents["#{mysubfolder[0]}".capitalize + " " + "#{mysubfolder[1]}".capitalize]=0
						end
					end
				end
			#p students
			end
		else
			if not (subfolder.split(/\//).last == "class009_homework") then
				Dir.glob("#{subfolder}/**/*.*").each do |myfile|
					extension = myfile.split(/\//).last.split(/\./).last
					name = myfile.split(/\//).last.split(/_/)
					if extension.length < 5 and !extension.include? '~'
						#p myfile.split(/\//).last
					end
					if !name[0].include? '.' and !name[1].include? '.' then
						if (name[0] != "results") and (name[0] != "Results") then
							hashstudents["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=0
						end
					end
				end
			end
		end
	end
end


b = Hash.new(0)
students.each do |v|
	b[v] += 1
end

b.each do |k, v|
	if k!=nil
		k = "#{k}".split(/\"/)[2].split(" ").first.capitalize + " " + "#{k}".split(/\"/)[2].split(" ").last.capitalize
		#puts "#{k} -> #{v}"
		if (v >= 3) then
			hashstudents[k] += 1
		end
	end
end
Dir.glob("#{ARGV[0]}/*").each do |subfolder|
	if (subfolder.split(/\//).last.split(/_/).last == "homework") or (subfolder.split(/\//).last.split(/_/).last == "nivo")
	#p subfolder.split(/\//).last
			if (subfolder.split(/\//).last == "vhodno_nivo")
				Dir.glob("#{subfolder}/**/*.*").each do |myfile|
					extension = myfile.split(/\//).last.split(/\./).last
					name = myfile.split(/\//).last.split(/_/)
					if extension.length < 5 and !extension.include? '~'
						#p myfile.split(/\//).last
					end
					if !name[0].include? '.' and !name[1].include? '.' then
								git_log = `git log --after="15.09.2014:11:10:00" --until=17.09.2014:20:00:00 #{myfile}`
print "git log working...(vh)\r"
								if !git_log.empty? and hashstudents["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]>=1 then						p "#{myfile} is in time"
									hashstudents["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]+=1
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
end
hashstudents.each do |k, v|
	hashstudents2[k] = 0
end

Dir.glob("#{ARGV[0]}/*").each do |subfolder|
	if (subfolder.split(/\//).last.split(/_/).last == "homework") or (subfolder.split(/\//).last.split(/_/).last == "nivo")
	#p subfolder.split(/\//).last
		if (subfolder.split(/\//).last == "class004_homework") then
			Dir.glob("#{subfolder}/*").each do |mysubfolderfullpath|
				mysubfolder = mysubfolderfullpath.split(/\//).last.split(/_/)
				if !mysubfolder[0].include? '.' and !mysubfolder[1].include? '.' then
					hashstudents2["#{mysubfolder[0]}".capitalize + " " + "#{mysubfolder[1]}".capitalize]=1
				end
				git_log = `git log --after="15.09.2014:11:10:00" --until=29.09.2014:20:00:00 #{mysubfolderfullpath}`
print "git log working...(004)\r"
				if !git_log.empty? and hashstudents2["#{mysubfolder[0]}".capitalize + " " + "#{mysubfolder[1]}".capitalize]=1 then					p "#{mysubfolderfullpath} is in time(004)"
					hashstudents2["#{mysubfolder[0]}".capitalize + " " + "#{mysubfolder[1]}".capitalize]=2
				end
			end
		end
	end
end
hashstudents.each do |k, v|
	hashstudents3[k] = 0
end
Dir.glob("#{ARGV[0]}/*").each do |subfolder|
		if (subfolder.split(/\//).last == "class002_homework") then
			Dir.glob("#{subfolder}/*.*").each do |myfile|
				name = myfile.split(/\//).last.split(/\./).first.split(/_/)
				if name[0] != nil and name[1] != nil
					if !name[0].include? '.' and !name[1].include? '.' then
						hashstudents3["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1
					end
					git_log = `git log --after="15.09.2014:11:10:00" --until=22.09.2014:20:00:00 #{myfile}`
	print "git log working...(002)\r"
					if !git_log.empty? and hashstudents3["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1 then					p "#{myfile} is in time"
						hashstudents3["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=2
					end
				end
			end
		end
end
hashstudents.each do |k, v|
	hashstudents4[k] = 0
end
Dir.glob("#{ARGV[0]}/*").each do |subfolder|
		if (subfolder.split(/\//).last == "class003_homework") then
			Dir.glob("#{subfolder}/*.*").each do |myfile|
				name = myfile.split(/\//).last.split(/\./).first.split(/_/)
				if name[0] != nil and name[1] != nil
					if !name[0].include? '.' and !name[1].include? '.' then
						hashstudents4["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1
					end
					git_log = `git log --after="15.09.2014:11:10:00" --until=24.09.2014:20:00:00 #{myfile}`
	print "git log working...(003)\r"
					if !git_log.empty? and hashstudents4["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1 then					p "#{myfile} is in time"
						hashstudents4["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=2
					end
				end
			end
		end
end


hashstudents.each do |k, v|
	hashstudents6[k] = 0
end

project_to_names = Hash.new

Dir.glob("#{ARGV[0]}/*").each do |subfolder|
	if (subfolder.split(/\//).last == "class009_homework") then

		CSV.foreach("#{subfolder}/project_to_names.csv") do |csv|
			project_to_names[csv[0]] = csv[1]
			hashstudents6[csv[1]]=1
		end
		project_to_names.each do |k, v|
			Dir.glob("#{subfolder}/**/#{k}.pdf").each do |myfile|
				git_log = `git log --after="15.09.2014:11:10:00" --until=27.10.2014:20:00:00 #{myfile}`
				print "git log working...(009)\r"
				if !git_log.empty? then
					p "#{myfile} is in time(009)"
					hashstudents6[v]=2
				end
			end
		end
	end
end


hashstudents.each do |k, v|
	hashstudents5[k] = 0
end
Dir.glob("#{ARGV[0]}/*").each do |subfolder|
		if (subfolder.split(/\//).last == "class012_homework") then
			Dir.glob("#{subfolder}/*.*").each do |myfile|
				name = myfile.split(/\//).last.split(/\./).first.split(/_/)
				if name[0] != nil and name[1] != nil
					if !name[0].include? '.' and !name[1].include? '.' then
						hashstudents5["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1
					end
					git_log = `git log --after="15.09.2014:11:10:00" --until=10.11.2014:20:00:00 #{myfile}`
	print "git log working...(012)\r"
					if !git_log.empty? and hashstudents5["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=1 then					p "#{myfile} is in time"
						hashstudents5["#{name[0]}".capitalize + " " + "#{name[1]}".capitalize]=2
					end
				end
			end
		end
end
p hashstudents
p hashstudents2
p hashstudents3
p hashstudents4
p hashstudents5
p hashstudents6

#hashstudents = Hash.new #vhodno
#hashstudents2 = Hash.new #004
#hashstudents3 = Hash.new #002
#hashstudents4 = Hash.new #003
#hashstudents5 = Hash.new #012

#p students
if ARGV[1] == "-o" then
	for i in 2..5
		if ARGV[i] == "csv" then
			CSVWriter.new.write(hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		end
		if ARGV[i] == "html" then
			HTMLWriter.new.write(hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		end
		if ARGV[i] == "xml" then
			XMLWriter.new.write(hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		end
		if ARGV[i] == "json" then
			JSONWriter.new.write(hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		end
	end
end

=begin
CSV.open("results.csv","w") do |csv|
	first_line = [' ',' ',"VH","002","003","004","009","012"]
	csv << [first_line].flatten.compact

 	hashstudents.sort.each do |key, value|
		key1 = key.split(' ')
		csv << [key1[0], key1[1], value, hashstudents3[key], hashstudents4[key], hashstudents2[key], hashstudents6[key], hashstudents5[key]].flatten.compact
	end
end
=end
