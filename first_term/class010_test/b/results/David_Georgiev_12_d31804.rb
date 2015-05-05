=begin Develop a program named FirstName_LastName_ClassNumber_d31804.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have only letters from a-z or A-Z in their names excluding extension. If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2.;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end

	require 'csv'
	file_names = []
	file_names2 = []
	Dir.glob("#{ARGV[0]}/**/*.*") do |current_file|
	
		name = current_file.split('/').last.split(/\./)
		def all_letters?(str)
			str[/[a-zA-Z]+/]  == str
		end
		if all_letters?(name[0])
			if not file_names.include?(["#{name[0]}", "#{(name[1].length)/2}"]) then
				file_names << (["#{name[0]}", "#{(name[1].length)/2}"])
			end
		end
	end
	Dir.glob("#{ARGV[1]}/**/*.*") do |current_file|
	
		name = current_file.split('/').last.split(/\./)
		def all_letters?(str)
			str[/[a-zA-Z]+/]  == str
		end
		if all_letters?(name[0])
			if not file_names.include?(["#{name[0]}", "#{(name[1].length)/2}"]) then
				file_names2 << (["#{name[0]}", "#{(name[1].length)/2}"])
			end
		end
	end
	CSV.open("result.csv", "w") do |csv|
		file_names.sort.each do |first, last|
			csv << ["#{first}","#{last}"]
		end
	end
