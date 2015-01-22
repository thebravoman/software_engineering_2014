=begin
Develop a program named FirstName_LastName_ClassNumber_0f79aa.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name DESC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end

hash1 = Hash.new
hash2 = Hash.new

Dir.glob(ARGV[0] + "*.*").each do |file|
	fname = file.split("/").last
	name = fname.split(".").first
	fstName = name.split("_")[0]
	sndName = name.split("_")[1]
	digit = name.split("_")[2]
	if fstName != nil && sndName != nil && digit != nil
		hash1[sndName] = fstName
	end
end

Dir.glob(ARGV[1] + "*.*").each do |file|
	fname = file.split("/").last
	name = fname.split(".").first
	fstName = name.split("_")[0]
	sndName = name.split("_")[1]
	digit = name.split("_")[2]
	if fstName != nil && sndName != nil && digit != nil
		hash2[sndName] = fstName
	end
end

hash1 = hash1.sort_by {|a,b| b}.reverse

csvFile = File.open("result.csv", "w")
hash1.each do |k,v|
	if hash2[k] == nil
		if hash2[:k] == nil
			csvFile.puts "#{k},#{v}"
		end
	end
end

$end
