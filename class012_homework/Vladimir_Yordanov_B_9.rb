require 'csv'
directories = Array.new
directories = ["/vhodno_nivo/", "/class002_homework/", "/class003_homework/", '/class004/', "/class009_homework/", "/class012_homework/"]
students = Hash.new do |hash,key|
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
	hash[key] = Hash.new
end


Dir.chdir(ARGV[0])
Dir.glob(ARGV[0] + directories[0] + "**/*.*") do |file| #vhodno_nivo
	firstName = file.split("/").last.split("_")[0]
	secondName = file.split("/").last.split("_")[1]
	if secondName != nil	
		personName = firstName.capitalize + "," + secondName.capitalize 
	end
	
	log = `git log --until=19.Sep.2014--20:00:00 #{file}`
	if !log.empty? && personName != nil
		students[personName]['01'] = "2"	 
	elsif log.empty? && personName != nil 
		students[personName]['01'] = "1"
	end
end

Dir.glob(ARGV[0] + directories[1] + "**/*.rb") do |file| #class02
	firstName = file.split("/").last.split("_")[0]
	secondName = file.split("/").last.split("_")[1]
	if secondName != nil	
		personName = firstName.capitalize + "," + secondName.capitalize 
	end
	
	log = `git log --until=22.Sep.2014--20:00:00 #{file}`
	if !log.empty? && personName != nil
		students[personName]['02'] = "2"	 
	elsif log.empty? && personName != nil 
		students[personName]['02'] = "1"	
	end
end

Dir.glob(ARGV[0] + directories[2] + "**/*.rb") do |file| #class03
	firstName = file.split("/").last.split("_")[0]
	secondName = file.split("/").last.split("_")[1]
	if secondName != nil	
		personName = firstName.capitalize + "," + secondName.capitalize 
	end
	
	log = `git log --until=24.Sep.2014--20:00:00 #{file}`
	if !log.empty? && personName != nil
		students[personName]['03'] = "2"	 
	elsif log.empty? && personName != nil 
		students[personName]['03'] = "1"	
	end
end

Dir.glob(ARGV[0] + directories[3] + "**/*.rb") do |file| #class04
	firstName = file.split("/").last.split("_")[0]
	secondName = file.split("/").last.split("_")[1]
	if secondName != nil	
		personName = firstName.capitalize + "," + secondName.capitalize 
	end
	
	log = `git log --until=29.Sep.2014--20:00:00 #{file}`
	if !log.empty? && personName != nil
		students[personName]['04'] = "2"	 
	elsif log.empty? && personName != nil 
		students[personName]['04'] = "1"	
	end
end

Dir.glob(ARGV[0] + directories[4] + "**/*.pdf") do |file| #class09
	
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
			students[personName]['09'] = "2"
		elsif log.empty?
			students[personName]['09'] = "1"
		end
	end
end


Dir.glob(ARGV[0] + directories[5] + "**/*.rb") do |file| #class12
	firstName = file.split("/").last.split("_")[0]
	secondName = file.split("/").last.split("_")[1]
	if secondName != nil	
		personName = firstName.capitalize + "," + secondName.capitalize 
	end
	
	log = `git log --until=10.Nov.2014--20:00:00 #{file}`
	if !log.empty? && personName != nil
		students[personName]['12'] = "2"	 
	elsif log.empty? && personName != nil 
		students[personName]['12'] = "1"		
	end


end

students.each do |k,v|
	if students[k]['01'] == nil
		students[k]['01'] = "0"
	end	
	if students[k]['02'] == nil
		students[k]['02'] = "0"
	end	
	if students[k]['03'] == nil
		students[k]['03'] = "0"	
	end
	if students[k]['04'] == nil
		students[k]['04'] = "0"
	end
	if students[k]['09'] == nil
		students[k]['09'] = "0"
	end
	if students[k]['12'] == nil
		students[k]['12'] = "0"
	end
end

CSV.open("results_Vladimir_Yordanov_B_9.csv", "wb") do |csv|
	csv << ["", "","VH", "002", "003", "004", "009", "012"  ]
	students.sort.to_a.each do |k,v|
		if k !=nil
			csv << k.split(",") + [students[k]['01']] + [students[k]['02']] + [students[k]['03']] + [students[k]['04']] + [students[k]['09']] + [students[k]['12']] 
		end	
	end
end



