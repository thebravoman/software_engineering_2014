require 'csv'
student = Hash.new
Dir.glob("#{ARGV[0]}/**/*_*_*.rb") do |directory|
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize

	if firstName.length == 5 && lastName.length == 5
		student[firstName] = lastName
	end
end

CSV.open("results.csv", "w") do |csv|
	student.sort_by{|key, value| key}.each do |element|
		csv << element
	end
end