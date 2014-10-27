#Iliyan_Germanov_17_f8b0d9.rb
=begin
	Develop a program named FirstName_LastName_ClassNumber_f8b0d9.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end
require 'csv'
results = Hash.new
results.compare_by_identity
def is_number(str)
str[/[0-9]+/] == str
end
Dir.glob("#{ARGV[0]}/*.rb") do |path1|
    filename1 = path1.split(/\//).last
    if filename1.split("_").size == 3
	firstname1 = filename1.split("_").first
	lastname1 = filename1.split("_")[1]
	digit1 = filename1.split("_")[2].split(".").first
	if is_number(digit1)
	    flag = 0
	    Dir.glob("#{ARGV[1]}/*.rb") do |path2|
		filename2 = path2.split(/\//).last
		if filename2.split("_").size == 3
		    digit2 = filename2.split("_")[2].split(".").first
		    if is_number(digit2)
			name1 = firstname1 + lastname1
			name2 = filename2.split("_").first + filename2.split("_")[1]
			if name1 == name2
			    flag = 1
			break	
		    end	
		end
	    end
	end
	if flag == 0
	    results[lastname1] = firstname1
	end
    end
end
end
CSV.open("result.csv", "w") do |csv|
    results.sort_by{|key, val| key}.each do |el|
	csv << el
    end
end

=begin

# this line may be wrong in some cases
*unfixed*
if filename1.count("_") == 2
*fixed*
if filename1.split("_").size == 3

=end