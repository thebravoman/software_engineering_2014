=begin
Develop a program named FirstName_LastName_ClassNumber_a8d711.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

hash = Hash.new

Dir.glob(ARGV[0] + "*.*").each do |file|
	filename = file.split("/").last
	if filename != nil
		fname = filename.split("_")[0]
		lname = filename.split("_")[1]
		if lname != nil && fname != nil && fname.length == 10
			hash[lname] = fname
		end
	end
end

hash = hash.sort.reverse

csvFile = File.open("result.csv", "w")
hash.each do |k,v|
	csvFile.puts "#{v},#{k}"
end
