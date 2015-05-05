=begin
Develop a program named FirstName_LastName_ClassNumber_71a643.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have only letters from a-z or A-Z in their names excluding extension. If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2.;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require'csv'

hash = Hash.new

Dir.glob(ARGV[0] + "/**/*").each do |file|
	name = file.split("/").last
	noext = name.split(".").first
	
	if name =~ /\d/
	else
		hash[name] = name.length/2
	end
end

Dir.glob(ARGV[1] + "/**/*").each do |file|
	name = file.split("/").last
	noext = name.split(".").first
	
	if name =~ /\d/
	else
		hash[name] = name.length/2
	end
end

hash = hash.sort.reverse
#puts hash


CSV.open("result.csv", "w") do |csv|
	hash.each do |element|
		csv << element
	end
end



