require 'csv'
require_relative "csv_writer.rb"
student = Hash.new()

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i
	if lastName.length < 8 && digits.odd?
		student[firstName] = lastName;
	end
end
writer = CSVWriter.new()

writer.write(student)

