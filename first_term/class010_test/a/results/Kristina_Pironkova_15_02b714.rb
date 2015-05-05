=begin
Develop a program named FirstName_LastName_ClassNumber_02b714.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

FirstName1,LastName1
FirstName2,LastName2
...
FirstNameN,LastNameN
=end



require 'csv'
result=Array.new
i=0
Dir.glob("#{ARGV[0]}*.rb") do |file_name|
	
	file_name=file_name.split("/").last
	first_name = file_name.split("/").last.split("_").first
	last_name=file_name.split("/").last.split("_",2).last.split("_").first
	task=file_name.split("/").last.split("_",2).last.split("_").last.split(".").first
	
		if task.to_i.to_s == task
			if (file_name.count("_") == 2) && (!first_name.empty?) && (!last_name.empty?)
				if last_name.length == 10
					result[i]=Array.new
					result[i][0]=first_name
					result[i][1]=last_name
					i +=1
				end
			end			
		end

end


CSV.open("result.csv", "w") do |csv|
	result.sort_by{|first,last| [last,first]}.each do |first,last|
	
	csv << [first,last]
	
	end
end

