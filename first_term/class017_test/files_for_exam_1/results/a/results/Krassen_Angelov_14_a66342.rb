=begin
Develop a program named FirstName_LastName_ClassNumber_a66342.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students with 5 letters in the first name that are in both folders.
A student is in both folders if it there is a file with the same First and Last Name. 
Digits might be different;
4. Sort the result by Last name ASC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN

=end


require 'csv'
hash_one = Hash.new
hash_two = Hash.new
hash = Hash.new
Dir.glob(ARGV[0]+"/*.*") do |student_task|
	first_name = student_task.split("/")[-1].split("_")[0]
	if first_name.length == 5
		last_name = "#{student_task.split("/")[-1].split("_")[1]}"
		full_name = "#{first_name},#{last_name}"
		hash_one[full_name] = last_name + "," +first_name 
	end
end
Dir.glob(ARGV[1]+"/*.*") do |student_task_two|
	first_name_two = student_task_two.split("/")[-1].split("_")[0]
	if first_name_two.length == 5
		last_name_two = "#{student_task_two.split("/")[-1].split("_")[1]}"
		full_name_two = "#{first_name_two},#{last_name_two}"
		hash_two[full_name_two] = last_name_two + "," + first_name_two
	end
end
hash_one.each do |key_one, value_one|
	hash_two.each do |key_two, value_two|
		if key_one == key_two
			hash[key_one] = value_one
		end
	end
end

hash = Hash[hash.sort_by{|k, v| v}]
CSV.open("result.csv", "w") do |csv|
	
	hash.each do |key, value|
		first = value.split(",")[1]
		last = value.split(",")[0]		
		csv << [last,first]
	end

end
