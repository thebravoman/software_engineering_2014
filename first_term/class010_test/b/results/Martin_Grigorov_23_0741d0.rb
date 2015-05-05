#Develop a program named FirstName_LastName_ClassNumber_0741d0.rb
#
#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 10 letters in their first name;
#4. Sort the result by Last Name DESC.
#5. Produce a result in CSV format named result.csv:
#
#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN
#

#
require 'csv'
#
student = Hash.new{|hash, key| hash[key] = []}
#
 
#
def wordcount(file_split)
#
    file_split.split("_").length
#
end
#
 
#
Dir.glob("#{ARGV[0]}/**/*.rb") do |file|
#
 
#
        first_name = file.split(/\//).last.split(/_/).first.capitalize 
#
        last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first.capitalize
#
        task_number = file.split(/\//).last.split("_").last.split(".").first
#
        file_split = file.split(/\//).last
#
        p = wordcount(file_split)
#
        if first_name.length == 10
#
                if ((first_name == "") || (first_name == " ") || (last_name == "") || (last_name == " "))
#
                  elsif p == 3
#
                        if (task_number.to_i >1) &&(task_number.to_i < 19)
#
                                student[first_name] = last_name
#
                        end
#
                end
#
        end
#
end
#
 
#
CSV.open("result.csv","w") do |csv|
#
        student.sort_by{|key,val| val}.reverse.each do |element|
#
                csv << element
#
       
#
        end
#
end
