#Develop a program named FirstName_LastName_ClassNumber_bd4324.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. some file names in this folder are in the format Firstname_LastName.csv . But there are also other files; 
#3. find all the CSV files that include "correct" in the file.
#4. Sort the result by Last Name ASC.
#5. Produce a result in HTML named result.html:


#<div class="students">
#		<ul>
#			<li>FirstName LastName</li>
#		</ul>
#	</div><div class="students">
#		<ul>
#			<li>FirstName2 LastName2</li>
#		</ul>
#	</div><div class="students">
#		<ul>
#			<li>FirstNameN LastNameN</li>
#		</ul>
#	</div>


require_relative  'Tihomir_Lidanski_htmlwriter_27_bd4324.rb'
	require 'csv'
	directory = ARGV[0]
	correct_files = Hash.new
	Dir.glob("#{directory}*_*.csv") do |file|
	file_name = file.split("/").last
	first = file_name.split("_").first
	last = file_name.split(".").first.split("_").last
	if file_name.count("_") == 1 then
	CSV.foreach(file) do |row|
	if row.include? "correct"
	correct_files[first] = last
	end
	end
	end
	end
	writer = HTMLWriter.new
	writer.write correct_files
