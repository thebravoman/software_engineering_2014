require 'csv'
student = Hash.new
student1 = Hash.new

def check(dir, hash, date)
	Dir.glob( "#{dir}").each do |script_file|
		#p "PATKA"
		student_name = script_file.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")
		#p student_name
		exists = `git log #{script_file}`
		commit_time = `git log --until=#{date} #{script_file}` 

		hash[student_name] = 0
		if !exists.empty?
			hash[student_name] = 1
		end
		if !commit_time.empty?
			hash[student_name] = 2
		end
	end
	return hash
end


check("../../class002_homework/*.rb", student1, "Sep--22--2014--20:00:00")
check("../../class004/*.rb", student,"Sep--29--2014--20:00:00")



CSV.open("results.csv","w") do |csv|
	student.sort.each do |key, value|
		csv << ["#{key}", " #{value}"]
	end
end

CSV.open("results1.csv","w") do |csv|
	student1.sort.each do |key, value|
		csv << ["#{key}", " #{value}"]
	end
end