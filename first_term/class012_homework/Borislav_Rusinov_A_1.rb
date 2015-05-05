require "csv"
results = Hash.new{|hash, key| hash[key] = [0,0,0,0,0]}
data=Hash.new{|name, tasks| name[tasks] = Array.new}
folder = 0

mainRow = "FirstName LastName","VH","002","003","004","012"
folder_name = ["vhodno_nivo","class002_homework", "class003_homework","class004","class012_homework"]
Dir.glob(ARGV[0]+"/vhodno_nivo/**/*.*").each do |directory|

	student_program=directory.split("/").last
	student_data = directory.split("/").last.split('.').first.split('_')
	student_name = "#{student_data[0].capitalize} #{student_data[1]}"
	task = student_data[2]

		if student_data.length == 3 
			if (task.to_i >1) && (task.to_i < 19) then data[student_name] << student_program end
			
		end
		
		if data[student_name].count >= 3 
		git_log = `git log --until=17.09.2014:20:00:00 #{directory}`
		
			if !git_log.empty?
				results[student_name][folder] = 2
			elsif git_log.empty?
				[student_name][folder] = 1
			end
	end

end

(0..4).each do |i|
	Dir.glob(ARGV[0]+"#{folder_name[i]}/*.*").each do |directory|		
		script_file = directory.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")
		
		if i == 0 then git_log = `git log --until=17.09.2014:20:00:00 #{directory}` end #vhodno_nivo
		if i == 1 then git_log = `git log --until=22.09.2014:20:00:00 #{directory}` end #class002
		if i == 2 then git_log = `git log --until=24.09.2014:20:00:00 #{directory}` end #class003
		if i == 3 then git_log = `git log --until=29.09.2014:20:00:00 #{directory}` end #class004
		#if i == 4 then git_log = `git log --until=27.10.2014:20:00:00 #{directory}` end #class009
		if i == 4 then git_log = `git log --until=10.11.2014:20:00:00 #{directory}` end #class012

			if !git_log.empty?
				results[script_file][folder] = 2
			elsif git_log.empty?
				[script_file][folder] = 1
			end
	end
		folder += 1
end

CSV.open("results_Borislav_Rusinov_A_1.csv","w") do |csv|
csv << mainRow
results.keys.sort.each do |key|
csv << [key, results[key]].flatten
end
end
