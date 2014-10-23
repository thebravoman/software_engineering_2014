require 'csv'
	student = Array.new
	student1 = Array.new
	
	Dir.glob(ARGV[0]+"/**/*.*").each do |file_name1|
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	p first_name
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	#task = file_name.split("_").last.split(".").first
	student << ["#{first_name}", "#{last_name}"]
	end
	
	Dir.glob(ARGV[1]+"/**/*.*").each do |file_name1|
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	p first_name
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	#task = file_name.split("_").last.split(".").first
	student1 << ["#{first_name}", "#{last_name}"]
	end
	
	CSV.open("result.csv", "w") do |csv|
	student.each do |fn, ln|
	student1.each do |fn1, ln1|
	if fn != fn1
	if ln != ln1
	csv << ["#{fn1}", "#{ln1}"]
	end
	end
	end
	end
	end 
