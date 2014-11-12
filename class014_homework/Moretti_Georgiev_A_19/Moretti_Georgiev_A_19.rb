require 'csv'
student = Hash.new{|hash, key| hash[key] = Array.new}

def check(dir, hash, date, i)
Dir.glob( "#{dir}").each do |programName|
#p "PATKA"
studentName = programName.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")
#p studentName
fileExists = `git log #{programName}`
commitTime = `git log --until=#{date} #{programName}` 
student[studentName][i] = 0
	if !fileExists.empty?
		hash[studentName][i] = 1
	end
	if !commitTime.empty?
		student[studentName][i] = 2
	end
end
	return student
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