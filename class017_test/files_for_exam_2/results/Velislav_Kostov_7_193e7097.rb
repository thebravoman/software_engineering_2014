=begin
Develop a program named FirstName_LastName_ClassNumber_193e7097.rb
You are given an argument for a folder with files.
Count how many of the words have 6 letters.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":9,"file2.rb":11,......
=end
hash = Hash.new(0) #key = filename, #value = count
Dir.glob(ARGV[0] + "*.*") do |filename|
    File.readlines(filename).each do |line|
        line.split(" ").each do |word|
            hash[filename] += 1
        end
    end
    hash.sort_by{|k,v| v}
    
    File.open("result.json") do |out|
        hash.each_pair {|k,v| out << "#{k}:#{v}"
    end
end
