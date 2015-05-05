=begin
Develop a program named FirstName_LastName_ClassNumber_7f4a5a.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by First name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end
require "csv"
student = Hash.new{|hash, key| hash[key] = []}
student1 = Hash.new{|hash, key| hash[key] =[]}
class String
  def is_number?
    Float(self) != nil rescue false
  end
end
Dir.glob(ARGV[0]+"/**/*.rb").each do |file|
	first_name = file.split(/\//).last.split(/_/).first	
	last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first
	task_number = file.split(/\//).last.split("_").last.split(".").first
	file_split = file.split(/\//).last
    p=file_split.split("_").length


		if ((first_name != "") || (first_name != " ") || (last_name != "") || (last_name != " "))
			if p == 3
				if (task_number.is_number?)
					student["#{first_name} #{last_name}"] << task_number.to_i
				end
			end
		end
end
		
Dir.glob(ARGV[1]+"/**/*.rb").each do |file1|
    first_name1= file1.split(/\//).last.split(/_/).first
	last_name1 = file1.split(/\//).last.split(/_/, 2).last.split("_").first
	task_number1 = file1.split(/\//).last.split("_").last.split(".").first
	file_split1 = file1.split(/\//).last
	p1=file_split1.split("_").length

		if ((first_name1 != "") || (first_name1 != " ") || (last_name1 != "") || (last_name1 != " "))
			if p1 == 3
				if (task_number1.is_number?)
					student1["#{first_name1} #{last_name1}"] << task_number1.to_i
				end
			end
		end
end
c = false
CSV.open("result.csv", "w") do |csv|
	student1.sort.each do |name, programs|
		student.sort.each do |name1, programs1|
			if name1 == name then c = true end
		end
			if c == false
				names = name.split(" ").reverse.flatten	
				csv << names	
			end
			c = false
	end
end
