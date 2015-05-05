=begin 
Develop a program named FirstName_LastName_ClassNumber_e2d2e61b.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 5 letters in FirstName and 5 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
	FirstName1,LastName1
	FirstName2,LastName2
			...
	FirstNameN,LastNameN
=end

require 'csv'
load 'Dimitar_Matev_Writer_e2d2e61b.rb'
hash1 = Hash.new
tempHash = Hash.new

#def flog file
#	return flogResult = `flog #{file} -c -q -s`.split(":").first.to_i	
#end
#flogResult = flog(file)

#def is_number?
#  Float(self) != nil rescue false
#end
#first.is_number? // pishem go f if 

#(first_name == "") || (first_name == " ") || (secound_name == "") || (task_number.is_number? == false)
# task_number = "#{student.split("/").last.split("_")[2]}"
Dir.glob(ARGV[0]+"/*.*") do |student|
	first_name = student.split("/").last.split("_")[0]
	secound_name = "#{student.split("/").last.split("_")[1]}"
	if first_name.length == 5 || secound_name.length == 5
		secound_name = "#{student.split("/").last.split("_")[1]}"
		fullName = "#{first_name}," + " #{secound_name}"
		hash1[fullName] = secound_name
	end

end

tempHash = hash1.sort_by {|k, v| k}

File.open("results.csv", "w") do |f|
		  tempHash.each do |key, value|
			f.puts "#{key.split(",").first},#{key.split(",").last}"
		  end
		end
writer = CSVWriter.new
writer.write(tempHash)
