#Develop a program named FirstName_LastName_ClassNumber_0d5526.rb
#
#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 10 letters in their first name;
#4. Sort the result by Last Name DESC.
#5. Produce a result in CSV format named result.csv:
#
#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN


require 'csv'
def is_numeric(o)
    true if Integer(o) rescue false
end
array = []
count = 0
Dir.glob(ARGV[0] + "*.rb") do |file|
	name = file.split("/").last.split(".").first.split("_")
	
	name[0] = name[0].to_s
	name[0] = name[0].capitalize
	
	name[1] = name[1].to_s
	name[1] = name[1].capitalize
	
	if name.size == 3 && is_numeric(name[2])
		if name[1].length == 10
	
			array[count] = []
			array[count][0] = name[0].to_s
			array[count][1] = " #{name[1].to_s}"
			count += 1
		
		end
	end
end
array = array.sort_by {|el| -el[1]}
CSV.open("result.csv", "w") do |csv|
	
		array.uniq.each do |e|
			
			csv << e
		
		end

end
