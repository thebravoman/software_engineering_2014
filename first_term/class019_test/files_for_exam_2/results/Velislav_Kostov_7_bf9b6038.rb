=begin
    Develop a program named FirstName_LastName_ClassNumber_bf9b6038.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 5 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1.rb,9
file2.rb,11
.....
fileN.rb,N
^
There shouldn't be newline at the end of the result file.
=end
require 'csv'
words = {}

Dir.glob(ARGV[0] + "*.rb") do |filename|
    File.open(filename, "r") do |file|
        file.each_line do |line|
            line.split(" ").each do |word|
                if(word.length == 5)
                    if(words[filename.split(/\//).last] == nil)
                        words[filename.split(/\//).last] = 1
                    else
                        words[filename.split(/\//).last] += 1
                    end 
                end
            end
        end
    end
end

words = words.sort_by{|k,v| v}.reverse.to_h
CSV.open("result.csv", "w") do |csv|
    words.each do |k,v|
        csv << [k,v]
    end
end


