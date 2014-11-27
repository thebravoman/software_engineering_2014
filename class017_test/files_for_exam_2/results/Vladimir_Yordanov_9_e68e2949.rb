=begin
Develop a program named FirstName_LastName_ClassNumber_e68e2949.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 7 letters in FirstName and 7 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
	FirstName1,LastName1
	FirstName2,LastName2
			...
	FirstNameN,LastNameN
=end

hash = hash.new

Dir.glob(ARGV[0] + "/**/*").each do |file|
	name = file.split("/").last
	noext = name.split(".").first
	firstname = noext.split("_").first
	lastname = noext.split("_").last
	
	if firstname.length == 7 & lastname.length == 7
		hash[firstname] = lastname
	end
end

hash = hash.sort


CSV.open("result.csv", "w") do |csv|
	hash.each do |element|
		csv << element
	end
end

