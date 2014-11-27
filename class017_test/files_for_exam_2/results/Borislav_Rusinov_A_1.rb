require 'csv'
file_hash = Hash.new

Dir.glob("#{ARGV[0]}/*.rb").each do |raw_file|
filename = raw_file.split("/").last
file = File.open("#{raw_file}")
file_read = file.readlines
	if file_read.length > 30
		file_hash[filename] = file_read.length.to_s
	end
end

file_hash = file_hash.sort_by{|key,val| val}
File.open("result.csv","w") do |csv|
	file_hash.each do |key,value|
	csv.puts("#{key},#{value}")
	end
end
