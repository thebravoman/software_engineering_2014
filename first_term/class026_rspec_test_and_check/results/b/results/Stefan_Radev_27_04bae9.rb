=begin
Develop a program named FirstName_LastName_ClassNumber_04bae9.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ASC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'

wrong_names = Array.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |text_file|
	names = text_file.split("/").last
	if (names.split("_").length != 3) || (names.split(".").last.to_s != "rb" )
		length_of_names = names.length
		wrong_names << ["#{names}", "#{length_of_names}"]
	end
end
Dir.glob("#{ARGV[1]}/**/*.*").each do |text_file|
	names = text_file.split("/").last
	if (names.split("_").length != 3) || (names.split(".").last.to_s != "rb" )
		length_of_names = names.length
		wrong_names << ["#{names}", "#{length_of_names}"]
	end
end

wrong_names.uniq!
wrong = wrong_names.sort_by{|f, l| l}
CSV.open("result.csv","w") do |csv|
	wrong.each do |length, name|
		csv << ["#{length}", "#{name}"]
	end
end
