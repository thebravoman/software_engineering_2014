#Ivo_Valchev_11_6c8bd9.rb
=begin
Develop a program named FirstName_LastName_ClassNumber_6c8bd9.rb

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

hash_fold1={}
hash_fold2={}

Dir.glob("#{ARGV[0]}*.*")  do |file|
		name = file.split("/").last.split(".").first.split("_")
		isNum = Integer(name[2]) rescue nil
		if name[0] and name[1] and name[0].length == 5 and !isNum!=nil hash_fold1.include?(name[0])
			hash_fold1["#{name[1]}"] = "#{name[0]}"
		end
end
Dir.glob("#{ARGV[1]}*.*") do |file|
		name = file.split("/").last.split(".").first.split("_")
		isNum = Integer(name[2]) rescue nil
		if name[0] and name[1] and name[0].length == 5 and !isNum!=nil and!hash_fold2.include?(name[0])
			hash_fold2["#{name[1]}"] = "#{name[0]}"
		end
end
File.open("result.csv", "w") do |csv|
	hash_fold1.sort.map do |key, value|
		if (hash_fold1[key]==hash_fold2[key])
			csv.puts("#{key},#{value}")
		end
	end
end