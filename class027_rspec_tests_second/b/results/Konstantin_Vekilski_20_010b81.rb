#Develop a program named FirstName_LastName_ClassNumber_010b81.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have only letters from a-z or A-Z in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2.;
#4. Sort the result by length DESC;
#5. Produce a result in CSV format named result.csv:

#			File1.extension,3
#			File2.extension,4
#			...
#			FileN.extension,3

hash=Hash.new

Dir.glob("#{ARGV[0]}/*.*") do |f1|
	file = f1.split(/\//).last
	file_name=file.split(".").first
	only_letter = true
	file_name.each_byte do |c|
		if !(c.chr =~ /[a-zA-Z]/)
			only_letter = false
			break
		end
	end
	if only_letter==true
		hash[file]=(file.length/2).floor
	end
end

Dir.glob("#{ARGV[1]}/*.*") do |f2|
	file = f2.split(/\//).last
	file_name=file.split(".").first
	only_letter = true
	file_name.each_byte do |c|
		if !(c.chr =~ /[a-zA-Z]/)
			only_letter = false
			break
		end
	end
	if only_letter==true
		hash[file]=(file.length/2).floor
	end
end

hash.sort_by {|key, value| value}.reverse

File.open("result.csv", "w") do |csv|
	hash.each do |k, v|
		csv.puts"#{k},#{v}"
	end
end