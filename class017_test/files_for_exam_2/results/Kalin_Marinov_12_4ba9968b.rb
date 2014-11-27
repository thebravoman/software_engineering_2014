#Develop a program named FirstName_LastName_ClassNumber_4ba9968b.rb;
#
#1. You are given two argument for two paths to two CSV files in format "FirstName,LastName":
#1.1 if there are other arguments they should be discarded;
#2. Find all the students that are in both CSV files;
#3. Sort the result by FirstName ASC;
#4. Produce a HTML named "result.html" in the following format:
#
#<html>
#<ul>
#	<li>FirstName1</li>
#	<li>FirstName2</li>
#	<li>FirstNameN</li>
#</ul>
#</html>

require 'csv'
require 'rexml/document'
include REXML

hash = Hash.new 

CSV.foreach(ARGV[0], "r") do |csv|
    hash[csv[0] + " " + csv[1]] = 1
end

CSV.foreach(ARGV[1], "r") do |csv|
    hash[csv[0] + " " + csv[1]] = 2 if hash[csv[0] + " " + csv[1]] == 1
end

file_html = Document.new
html = file_html.add_element "html"
ul = html.add_element "ul"

hash.sort.each do |key, value|
	if value == 2
		li = ul.add_element("li")   
		li.text = key.split(" ").first
	end
end

File.open("result.html", "w") do |html|
    html.write(file_html)
end

