#Kristina_Pironkova_15_890ba0.rb
=begin
Develop a program named FirstName_LastName_ClassNumber_890ba0.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 10 letters in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end


require 'csv'
results=Hash.new
Directory = ARGV[0]
Dir.glob("#{Directory}/*.rb") do |file_name|
	
	first_name = file_name.split("/").last.split("_").first.capitalize
	last_name=file_name.split("/").last.split("_",2).last.split("_").first.capitalize
	
		if first_name.length == 10
			
			results["#{last_name}"] ="#{first_name}"
		end

end


CSV.open("results.csv", "w") do |csv|
	results.sort.each do |first,last|
	
	csv << [last,first]
	
	end
end 
