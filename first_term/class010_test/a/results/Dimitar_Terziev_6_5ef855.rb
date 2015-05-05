=begin
Develop a program named FirstName_LastName_ClassNumber_5ef855.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ASC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'
h = Hash.new
Dir.glob("#{ARGV[0]}*.rb*"){|file|
	file_str = file.to_s.split('/').last
	if(file_str =~ /[0-9a-zA-Z]+_[0-9a-zA-Z]+_\d+\.rb/)
	else
		h[file_str]=file_str.length
	end
}
Dir.glob("#{ARGV[1]}*.rb*"){|file|
	file_str = file.to_s.split('/').last
	if(file_str =~ /[0-9a-zA-Z]+_[0-9a-zA-Z]+_\d+\.rb/)
	else
		h[file_str]=file_str.length
	end
}
CSV.open('result.csv','w'){|csv|
	h.sort_by{|k,v|k}.sort_by{|k,v|v}.each{|el|
		csv << el
	}
}
