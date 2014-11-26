require 'csv'
require_relative "xml_writer.rb"
student = Hash.new

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 

	flogResult = `flog #{directory}`.split(":").first.gsub!(/\s+/, "").to_i

	if flogResult < 350 && flogResult > 200
		firstName 	= directory.split("/").last.split("_").first.capitalize
		lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
		student[firstName] = lastName
	end
end
writer = XMLWriter.new()

writer.write(student)