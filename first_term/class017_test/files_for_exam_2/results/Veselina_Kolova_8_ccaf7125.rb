=begin
Develop a program named FirstName_LastName_ClassNumber_ccaf7125.rb
You are given an argument for a folder with files.
Count how many of the words have 5 letters.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1.rb,9
file2.rb,11
.....
=end

results = Hash.new
count = 0
Dir.glob("#{ARGV[0]}/**/*.*") do |file|
File.open("file", "r") do |s|
    while (line = infile.gets)
        if line.length==5 then
        	count = count + 1
        end
    end
    results[s] = count
    end
end


results = results.sort_by{|k, v| v}
CSV.open("result.csv", "w") do |csv|
	results.each do |f, l|
		csv << [f, l]
	end
end						

