require 'csv'
student = Hash.new{|hash, key| hash[key] = Array.new}
#student1 = Hash.new



def check(dir, hash, date, i)
	Dir.glob( "#{dir}").each do |script_file|
		#p "PATKA"
		student_name = script_file.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")
		#p student_name
		exists = `git log #{script_file}`
		commit_time = `git log --until=#{date} #{script_file}` 
		hash[student_name][i] = 0
		if !exists.empty?
			hash[student_name][i] = 1
		end
		if !commit_time.empty?
			hash[student_name][i] = 2
		end
	end
	return hash
end


check("../../class002_homework/*.rb", student, "Sep--22--2014--20:00:00", 0)
check("../../class003_homework/*.rb", student, "Sep--24--2014--20:00:00", 1)
check("../../class004/*.rb", student, "Sep--29--2014--20:00:00", 2)
check("../../class012_homework/*.rb", student, "Nov--10--2014--20:00:00", 3)



CSV.open("results.csv","w") do |csv|
	student.sort.each do |key, value|
		csv << ["#{key}", " #{value}"]
	end
end

=begin
CSV.open("results1.csv","w") do |csv|
	student1.sort.each do |key, value|
		csv << ["#{key}", " #{value}"]
	end
end
=end
