=begin
Develop a program named FirstName_LastName_ClassNumber_88db52.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 5 letters in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN


=end
require 'csv'
arr = []
Dir.glob("#{ARGV[0]}*.rb*"){|file|
	file_str = file.split('/').last
	if(file_str=~/\A[a-zA-Z]+\_[a-zA-Z]+\_\d+\.rb\z/ && file_str.split('_')[1].size == 5)
		arr.push("#{file_str.split('_')[1]} #{file_str.split('_').first}")
	end
}
CSV.open('result.csv','w'){|csv|
	arr.uniq.sort.each{|el|
		csv << "#{el.split(' ').last} #{el.split(' ').first}".split(' ')
	}
}
