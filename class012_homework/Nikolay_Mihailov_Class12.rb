require 'csv'
classes = " "," ","VH","002","003","004","009","012"

result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0]}
result_sorted = Hash.new
folder = 0
content=Array.new
name_array = Array.new
team_names = Array.new

Dir.glob(ARGV[0]+"/vhodno_nivo/**/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.scan("_").length == 2
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--17--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end

	end
end

folder +=1
Dir.glob(ARGV[0]+"/class002_homework/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--22--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
Dir.glob(ARGV[0]+"/class003_homework/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--24--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
Dir.glob(ARGV[0]+"class004/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--29--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
team_names = CSV.read("../class009_homework/project_to_names.csv")[1, 53]
Dir.glob(ARGV[0]+"class009_homework//*.pdf").each do |file|	
	name = file.split(/\//).last.split(".").first
	i = 0
	z = 0
	line = 0
	first_line = false
	for z in 0..51
	 	if team_names[z][0] == name 			
			line = z if first_line != true
			first_line = true
			i +=1		
		end		
	end

	log = `git log --until=Oct--27--2014--20:00:00 #{file}`

	if !log.empty?
		for index in 0..i-1 
			final_name = team_names[line + index][1]
			final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
			result[final_name][folder] = 2
		end
	elsif log.empty?
		for index in 0..i-1
			final_name = team_names[line + index][1]
			final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
			result[final_name][folder] = 1
		end
	end
	
end



#result_sorted = result
#result_sorted.keys.each do |key|
#		key = key.split(",")
#		puts key
#	end
#result_sorted = Hash[result.sort_by{|hash, key| hash[key] hash}.reverce] 
#result_sorted = result.keys.sort.reverce 

CSV.open("results2.csv","w") do |csv|
	csv << classes
	result.keys.each do |key|
		if key.include? ','
			key_split = key.split(",")
		end
		csv << [key_split,result[key]].flatten
	end
end
