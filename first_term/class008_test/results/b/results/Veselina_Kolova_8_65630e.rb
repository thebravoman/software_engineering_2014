=begin
Develop a program named FirstName_LastName_ClassNumber_65630e.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 5 letters in their second name;
4. Sort the result by First name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

require 'csv'

people = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |text_file|

	if File.extname(text_file) text_file.include?(".rb") && text_file.split(/_/).last.split(/\./).first.to_i.is_a Integer then
		if (text_file.split("/").last.split("_").length == 3) then
		        text_file = text_file.split("/").last
		        if (text_file.split("_")[1].length == 5) then
		                people[text_file.split("_")[1]] = text_file.split("_")[0]
		        end
		end
	end
end

people = Hash[people.sort_by{|k,v| k}.reverse]

CSV.open("result.csv","w") do |csv|
    people.each do |element|
    csv << element
    end
end
