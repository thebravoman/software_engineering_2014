=begin
Develop a program named FirstName_LastName_ClassNumber_9d3149.rb

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

hash = Hash.new

Dir.glob(ARGV[0] + "*.*").each do |file|
	fname = file.split("/").last
	name = fname.split(".").first
	if name[/^[A-Za-z]+$/] != nil
		hash[fname] = fname.length/2
	end
end

Dir.glob(ARGV[1] + "*.*").each do |file|
	fname = file.split("/").last
	name = fname.split(".").first
	if name[/^[A-Za-z]+$/] != nil
		hash[fname] = fname.length/2
	end
end

hash = hash.sort_by {|a,b| b}.reverse

csvFile = File.open("result.csv", "w")
hash.each do |k,v|
	csvFile.puts "#{k},#{v}"
end
