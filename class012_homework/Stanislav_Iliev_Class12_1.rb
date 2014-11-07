require 'csv'
classes = " "," ","VH","002","003","004","009","012"
folder_name = ["class002_homework", "class003_homework","class004","class012_homework"]
result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0]}
folder = 0
prg_count = 0
i = 0
name_array = Array.new

Dir.glob(ARGV[0]+"vhodno_nivo/**/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.scan("_").length == 2
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--17--2014--20:00:00 #{file}`
		if !log.empty?
			name_array[i] = name
		elsif log.empty?
			name_array[i] = name + '1'
		end
		i += 1
	end
end
name_array.sort!

for i in 0..name_array.size
	if i != name_array.size
		if name_array[i] == name_array[i+1]
			prg_count += 1
		end
		if prg_count == 2
			if name_array[i].include? ('1')
				name_array[i] = name_array[i].delete("1")
				result[name_array[i]][folder] = 1
				prg_count = 0
			elsif !name_array[i].include? ('1')
				result[name_array[i]][folder] = 2
				prg_count = 0
			end
		end
	end
end
folder = 1
for i in 0..3
	Dir.glob(ARGV[0]+"#{folder_name[i]}/*.*").each do |file|
		short_file = file.split(/\//).last
		if short_file.include? ("_")
			first_name = short_file.split(/_/).first.capitalize
			last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
			name = first_name + ',' + last_name
			if i == 0
				log = `git log --until=Sep--22--2014--20:00:00 #{file}`
			elsif i == 1
				log = `git log --until=Sep--24--2014--20:00:00 #{file}`
			elsif i == 2
				log = `git log --until=Sep--29--2014--20:00:00 #{file}`
			elsif i == 3
				log = `git log --until=Nov--10--2014--20:00:00 #{file}`
			end
			#result[name] = Hash.new
			if !log.empty?
				result[name][folder] = 2
			elsif log.empty?
				result[name][folder] = 1
			end
		end
	end
	folder += 1
end

CSV.open("results.csv","w") do |csv|
	csv << classes
	result.keys.each do |key|
		key_split = key.split(",")
		csv << [key_split,result[key]].flatten
	end
end
