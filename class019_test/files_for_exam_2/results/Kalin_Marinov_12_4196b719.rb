# Develop a program named FirstName_LastName_ClassNumber_4196b719.rb;
#
# 1. You are given two argument for two paths to two CSV files in format "FirstName,LastName":
# 1.1 if there are other arguments they should be discarded;
# 2. Find all the students that are in both CSV files;
# 3. Sort the result by LastName ASC;
# 4. Produce a HTML named "result.html" in the following format:
#
# <html>
# <ul>
# 	<li>LastName1</li>
#	<li>LastName2</li>
#	<li>LastNameN</li>
# </ul>
# </html>

require 'csv'
require 'rexml/document'
include REXML

hash = Hash.new 
second_hash = Hash.new

CSV.foreach(ARGV[0], "r") do |csv|
    hash[csv[0] + " " + csv[1]] = 1
end

CSV.foreach(ARGV[1], "r") do |csv|
    hash[csv[0] + " " + csv[1]] = 2 if hash[csv[0] + " " + csv[1]] == 1
end

hash.each do |key, value|
	if value == 2
		second_hash[key.split(" ").last] = 1
	end
end

file_html = Document.new
html = file_html.add_element "html"
ul = html.add_element "ul"

second_hash.sort.each do |key, _|
	li = ul.add_element("li")   
	li.text = key
end

File.open("result.html", "w") do |html|
    html.write(file_html)
end
