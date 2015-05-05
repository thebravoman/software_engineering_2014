=begin
Develop a program named FirstName_LastName_ClassNumber_277028c8.rb

You are given an argument for a folder with .rb files. Other arguments should be discarded.
Find all the files from the folder which have more than 30 lines.
Sort the result by number of lines ASC
Produce a result in CSV format named result.csv. 

file1,3
file2,10
..
fileN,N
^ There shouldn't be a newline at the end of the result file.
=end

require 'csv'
patka = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	filename = raw_file.split("/").last
	file = File.open("#{raw_file}")
	file_read = file.readlines
	if file_read.length > 30
		patka[filename] = file_read.length.to_s 
	end
end

patka = patka.sort_by{|key,val| val}

CSV.open("result.csv","w") do |csv|
	patka.each do |key,value|
		csv << [key,value]
	end
end
=begin
 __     ________ _      _      ______          __  _____     _______ _  __           
 \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\ 

=end
