require_relative "json_writer.rb"
student = Hash.new()
Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i
	
	firstDigit = digits / 10
	secondDigit = digits % 10
	
	p digits
	if firstDigit + secondDigit > 7
		p digits
		student[firstName] = lastName
	end
end
writer = JSONWriter.new()

writer.write(student)