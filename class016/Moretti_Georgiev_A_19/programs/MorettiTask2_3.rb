require 'csv'
student = Hash.new

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 

	flogResult = `flog #{directory}`.split(":").first.gsub!(/\s+/, "").to_i
	

	if flogResult > 200 && flogResult < 350
		firstName 	= directory.split("/").last.split("_").first.capitalize
		lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
		student[firstName] = lastName
	end
end
writer = CSVWriter.new()

writer.write(student)