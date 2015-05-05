=begin
Develop a program named FirstName_LastName_ClassNumber_9514d0.rb

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
list = Hash.new

Dir.glob("#{ARGV[0]}/*.rb") do |name|
	name = name.split('/').last.split('_')
	if name[1].length == 5
		list[name[0]] = name[1]
	end
end

list = Hash[list.sort_by{|fn,ln| fn}.reverse]

CSV.open("result.csv","w") do |csv|
	list.each do |names|
		csv << names
	end
end


