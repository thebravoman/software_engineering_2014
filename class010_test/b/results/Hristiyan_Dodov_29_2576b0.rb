#Develop a program named FirstName_LastName_ClassNumber_2576b0.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:

#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN

fold1 = ARGV[0]
fold2 = ARGV[1]
hash1 = Hash.new
hash2 = Hash.new

for i in 2..ARGV.length do
	ARGV[i] = 0
end

Dir.glob(fold1 + "/*").each do |file1|
	str = file1[/[A-Za-z]{5}_[A-Za-z]+_\d+\..+/]
	
	if str != nil
		firstName = str.split('_')[0]
		lastName = str.split('_')[1]
		digit = str.split('_')[2].split('.').first
		hash1[lastName + digit] = [firstName, digit, lastName]
	end
end

Dir.glob(fold2 + "/*").each do |file2|
	str = file2[/\/[A-Za-z 0-9]{5}_[A-Za-z 0-9]+_\d+\..+/]
	
	if str != nil
		firstName = str.split('_')[0]
		firstName = firstName[/[A-Za-z]+/]
		lastName = str.split('_')[1]
		digit = str.split('_')[2].split('.').first
		hash2[lastName + digit] = [firstName, digit, lastName]
	end
end

hashFinal = Hash.new

hash1.each do |key, val|
	hash2.each do |key2, val2|
		if val[2] == val2[2] && val[0] == val2[0]
			hashFinal[val[2]] = [val[0], val[1], val[2]]
			hashFinal[val2[2]] = [val2[0], val2[1], val2[2]]
		end
	end
end

hashFinal = hashFinal.sort

csvFile = File.new("result.csv", "w")

hashFinal.each do |key, val|
	csvFile.puts "#{val[2]},#{val[0]}"
end

csvFile.close

$end
