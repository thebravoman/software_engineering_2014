=begin
Develop a program named FirstName_LastName_ClassNumber_fc0f0c.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 5 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end



require 'csv'

students = Array.new
Dir.glob("#{ARGV[0]}/**/*_*_*.rb") do |my_text_file|
	s = my_text_file.split('/').last.split('_')
	first_name = s[0]
	last_name = s[1]
	if last_name != nil && last_name.length == 5
		students << ["#{first_name}", "#{last_name}"]
	end
end
st = students.sort_by{|f, l| l}
CSV.open("result.csv", "w") do |csv|
	st.each do |first, last|
		csv << ["#{first}", "#{last}"]
	end
end						

