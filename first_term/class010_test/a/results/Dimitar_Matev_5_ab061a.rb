=begin 
Develop a program named FirstName_LastName_ClassNumber_ab061a.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end

require 'csv'
hash1 = Hash.new
hash2 = Hash.new
tempHash = Hash.new
Dir.glob(ARGV[0]+"/*.*") do |student|
	
	first_name = student.split("/").last.split("_")[0]
	if first_name.length == 5
		secound_name = "#{student.split("/").last.split("_")[1]}"
		fullName = "#{first_name}," + " #{secound_name}"
		hash1[fullName] = secound_name
	end

end
Dir.glob(ARGV[1]+"/*.*") do |student1|
	
	first_name = student1.split("/").last.split("_")[0]
	if first_name.length == 5
		secound_name = "#{student1.split("/").last.split("_")[1]}"
		fullName = "#{first_name}," + " #{secound_name}"
		hash2[fullName] = secound_name
	end

end

hash1.each do |key1, value1|
	hash2.each do |key2, value2|
		if key1 == key2
			tempHash[key1] = value1 
		end
	end
end

tempHash = tempHash.sort_by {|k, v| k}

File.open("result.csv", "w") do |f|
  tempHash.each do |key, value|
    f.puts "#{value},#{key.split(",").first}"
  end
end
